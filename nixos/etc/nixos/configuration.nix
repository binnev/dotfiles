{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hosts/legion/configuration.nix
  ];
}
