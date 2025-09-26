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
    # This ensures that pipx uses the same python version. Before, I had
    # installed pipx as a separate package, and it came bundled with python3.12
    # for some reason. So I couldn't install python3.13 apps.
    (python313.withPackages (ps: with ps; [pipx]))
    postman
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
