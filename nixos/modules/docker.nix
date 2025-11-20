{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      autoStart = true;
    };
  };
}
