{
  config,
  pkgs,
  ...
}: {
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  # GNOME uses dconf to store settings
  programs.dconf.enable = true;
}
