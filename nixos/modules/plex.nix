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

  services.plex = {
    enable = true;
    openFirewall = true;
  }; 
  
  # disable autostart. mkForce is required here to _set_ the wantedBy to `[]`, 
  # instead of _adding_ `[]` to the wantedBy. systemd.services.plex.wantedBy =
  lib.mkForce []; 

  # NOTE: You'll need to create the media library folder, and make it owned by 
  # the "plex" group, for plex to be able to see files inside

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
}
