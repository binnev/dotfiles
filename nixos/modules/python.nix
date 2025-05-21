{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    uv
    pre-commit
  ];

  # allow running dynamically linked binaries (ruff is one of these)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in
    # environment.systemPackages
  ];
}
