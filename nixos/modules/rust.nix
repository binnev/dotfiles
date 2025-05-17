{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    gcc
    cargo-watch
  ];

  nix.settings.trusted-users = ["root" "robin"];
}
