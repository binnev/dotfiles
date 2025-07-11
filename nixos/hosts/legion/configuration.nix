# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nvidia.nix
    ./home.nix
    ../../modules/desktop.nix
    ../../modules/users.nix
    ../../modules/packages.nix
    ../../modules/networking.nix
    ../../modules/locale.nix
    ../../modules/rust.nix
    ../../modules/python.nix
    ../../modules/i3.nix
    ../../modules/plex.nix
    ../../modules/auto-upgrade.nix
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "legion"; # Define your hostname.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.xserver = {
    # X11 keyboard layout
    xkb = {
      layout = "us";
      variant = "";
    };

    enable = true;
    libinput.enable = true;

    inputClassSections = [
      ''
        Identifier "Reverse touchpad scrolling"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "NaturalScrolling" "true"
      ''
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
  services.logind.lidSwitchDocked = "ignore";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
