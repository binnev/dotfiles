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
    # This clashes with gnome's display manager
    # displayManager = {
    #   lightdm = {
    #     enable = true;
    #     greeters.slick = {
    #       enable = true;
    #       theme.name = "Zukitre-dark";
    #     };
    #   };
    # };
  };

  # Copied from https://gist.github.com/nat-418/1101881371c9a7b419ba5f944a7118b0
  environment.systemPackages = with pkgs; [
    elementary-xfce-icon-theme
    catfish
    gigolo
    orage
    xfburn
    xfce4-appfinder
    xfce4-clipman-plugin
    xfce4-cpugraph-plugin
    xfce4-dict
    xfce4-fsguard-plugin
    xfce4-genmon-plugin
    xfce4-netload-plugin
    xfce4-panel
    xfce4-pulseaudio-plugin
    xfce4-systemload-plugin
    xfce4-weather-plugin
    xfce4-whiskermenu-plugin
    xfce4-xkb-plugin
    xfdashboard
  ];

  hardware = {
    bluetooth.enable = true;
  };

  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services.blueman.enable = true;
}
