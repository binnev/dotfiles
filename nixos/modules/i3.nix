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
        noDesktop = true;
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

    excludePackages = with pkgs; [
      xterm
    ];
    displayManager = {
      lightdm = {
        enable = true;
        greeters.slick = {
          enable = true;
          theme.name = "Zukitre-dark";
        };
      };
    };
  };
  services.displayManager.defaultSession = "xfce";

  # Copied from https://gist.github.com/nat-418/1101881371c9a7b419ba5f944a7118b0
  environment.systemPackages = with pkgs; [
    zuki-themes
    elementary-xfce-icon-theme
    xfce.catfish
    xfce.gigolo
    xfce.orage
    xfce.xfburn
    xfce.xfce4-appfinder
    xfce.xfce4-clipman-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-dict
    xfce.xfce4-fsguard-plugin
    xfce.xfce4-genmon-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-panel
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-systemload-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-xkb-plugin
    xfce.xfdashboard
  ];

  hardware = {
    bluetooth.enable = true;
  };

  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services.blueman.enable = true;
}
