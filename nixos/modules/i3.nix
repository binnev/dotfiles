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
        # gnome utils I want to keep in i3
        gnome-control-center
        gnome-settings-daemon
        networkmanagerapplet # for tray-based network config
        blueman # for bluetooth
        arandr # or use gnome's tool for screen layout
      ];
    };
  };
}
