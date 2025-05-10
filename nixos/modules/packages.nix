{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    obsidian
    stow
    fastfetch
    fzf
    jq
    lazygit
    lazydocker
    starship
    zoxide
    tree
    alacritty
    vscode
    alejandra
    gnome-control-center
    rofi
    gnome-tweaks
    polybar
    htop
    killall
    picom
    feh
    inkscape
    flameshot
    lshw
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
