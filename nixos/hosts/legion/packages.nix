{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gimp3
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}
