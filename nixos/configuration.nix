{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hosts/legion/configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
