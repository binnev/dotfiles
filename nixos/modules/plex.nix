{
  config,
  pkgs,
  ...
}: {
  # read this https://wiki.nixos.org/w/index.php?title=Deluge&mobileaction=toggle_view_desktop
  environment.systemPackages = with pkgs; [
    plex
    deluge
  ];

  systemd.services.plex = {
    description = "Plex media server";
    after = ["network.target"];
    wantedBy = [];
    serviceConfig = {
      ExecStart = "${pkgs.plex}/bin/plexmediaserver";
      Restart = "on-failure";
      User = "plex";
      Group = "plex";
    };
  };

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
}
