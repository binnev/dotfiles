{
  config,
  pkgs,
  inputs,
  ...
}: {
  # see: https://nixos.wiki/wiki/Automatic_system_upgrades
  system.autoUpgrade = {
    enable = true;

    # Specifies that the system should upgrade using your current flake (the
    # same repo/config you're using now).
    flake = inputs.self.outPath;
    flags = [
      "--update"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  # Garbage collect old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
