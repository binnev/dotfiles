{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # GNOME uses dconf to store settings
  programs.dconf.enable = true;
}
