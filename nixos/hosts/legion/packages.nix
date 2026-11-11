{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gimp3
    gthumb
    xbindkeys
    xbacklight
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  programs.steam = {
    enable = true;
  };
}
