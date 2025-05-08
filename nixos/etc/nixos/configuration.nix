{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hosts/legion/configuration.nix
  ];

  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
