{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gimp3
    gthumb
    xbindkeys
    xorg.xbacklight
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
