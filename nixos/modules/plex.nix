{
  config,
  pkgs,
  ...
}: {
  services.plex = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    deluge
    mullvad-vpn
  ];
}
