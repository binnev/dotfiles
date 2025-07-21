{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gimp3
    gthumb
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
