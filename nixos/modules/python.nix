{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./docker.nix
  ];

  environment.systemPackages = with pkgs; [
    uv
    pre-commit
    python313
  ];

  # Automatically do `nix develop` when you cd into a project directory with a
  # .envrc and flake.nix
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # allow running dynamically linked binaries (ruff is one of these)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in
    # environment.systemPackages
  ];
}
