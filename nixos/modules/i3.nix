{
  config,
  pkgs,
  callPackage,
  ...
}: {
  services.xserver = {
    enable = true;

    # XFCE as desktop manager only
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = false; # still have top panel
        enableXfwm = false;
      };
    };

    # i3 as window manager
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
  services.displayManager.defaultSession = "xfce";
}
