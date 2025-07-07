{
  config,
  pkgs,
  lib,
  ...
}: {
  # read this https://wiki.nixos.org/w/index.php?title=Deluge&mobileaction=toggle_view_desktop
  environment.systemPackages = with pkgs; [
    deluge
  ];

  # services.plex = {
  #   enable = true;
  #   openFirewall = true;
  # };
  # systemd.services.plex.wantedBy = lib.mkForce []; # disable autostart

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
}
