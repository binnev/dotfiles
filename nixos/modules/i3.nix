{
  config,
  pkgs,
  callPackage,
  ...
}: {
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        polybar
        i3lock #default i3 screen locker
        networkmanagerapplet # for tray-based network config
        blueman # for bluetooth
        arandr # or use gnome's tool for screen layout
      ];
    };
  };
}
