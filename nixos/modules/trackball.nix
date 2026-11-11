{
  config,
  pkgs,
  callPackage,
  ...
}: {
  services.libinput.enable = true;

  # Sets the accel profile just for the trackball
  services.xserver.inputClassSections = [
    ''
      Identifier "Custom Mouse Profile"
      MatchProduct "Kensington Expert Mouse"
      Driver "libinput"
      Option "AccelProfile" "flat"
      Option "AccelSpeed" "-0.75"
    ''
  ];
}
