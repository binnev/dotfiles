{
  config,
  pkgs,
  ...
}: {
  services.plex = {
    enable = true;
    openFirewall = true;
  };

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # read this https://wiki.nixos.org/w/index.php?title=Deluge&mobileaction=toggle_view_desktop
  environment.systemPackages = with pkgs; [
    deluge
  ];
}
