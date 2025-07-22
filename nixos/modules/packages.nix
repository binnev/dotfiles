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
    rofi
    polybar
    htop
    killall
    picom
    feh
    inkscape
    flameshot
    lshw
    yazi # terminal file manager written in Rust
    tokei # counts lines of code in a project
    xclip
    pavucontrol # audio controls
    dua # Disk Usage Analyzer written in rust: `dua i` for interactive mode
    dust # alternative to dua
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
