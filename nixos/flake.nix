{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # This makes home-manager use the existing nixpkgs so we don't download 2
      # different versions of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      legion = nixpkgs.lib.nixosSystem {
        # This takes the inputs from this flake, and passes them as parameters
        # to the module
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/legion/configuration.nix
          # This imports the home manager module into our configuration
          inputs.home-manager.nixosModules.default
        ];
      };

      chromebook = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/chromebook/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
