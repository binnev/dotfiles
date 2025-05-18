{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    gcc
    cargo-watch
    pre-commit
  ];

  nix.settings.trusted-users = ["root" "robin"];
}
