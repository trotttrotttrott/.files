{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  users.users.trott = {
    isNormalUser = true;
    home = "/home/trott";
    extraGroups = [ "docker" "wheel" ];
    hashedPassword = "$6$JmaS7kVzZJyNkKea$Lp2h1tKt083Q3fy6pFvxItUqUxmWflSepVGtHO0DNAbYrc7YDX50iyeTWXPoytEkAYwSfXqhsd8hzkUBIRZcK0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtAJZwcFQ3X9uWyDWoD5HJmosrOHOT00TiOJOum26jW NixOS VMs"
    ];
  };

  # Be careful updating this.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix = {
    # use unstable nix so we can access flakes
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "dev";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Don't require password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Virtualization settings
  virtualisation.docker.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    gnumake
    spice-vdagent
    xclip
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = true;
  services.openssh.permitRootLogin = "no";

  # Disable the firewall since we're in a VM and we want to make it
  # easy to visit stuff in here. We only use NAT networking anyway.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
