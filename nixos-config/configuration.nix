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

  # We expect to run the VM on hidpi machines.
  hardware.video.hidpi.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "dev";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  # Don't require password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Virtualization settings
  virtualisation.docker.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # setup windowing environment
  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 220;

    desktopManager = {
      xterm.enable = false;
      wallpaper.mode = "fill";
    };

    # displayManager = {
    #   defaultSession = "none+i3";
    #   lightdm.enable = true;

    #   # AARCH64: For now, on Apple Silicon, we must manually set the
    #   # display resolution. This is a known issue with VMware Fusion.
    #   # sessionCommands = ''
    #   #   ${pkgs.xorg.xset}/bin/xset r rate 200 40
    #   # '';
    # };

    # windowManager = {
    #   i3.enable = true;
    # };
  };

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

  # UTM things...
  #
  # Interface is this on my M1
  networking.interfaces.enp0s10.useDHCP = true;
  # Qemu
  services.spice-vdagentd.enable = true;
  # For now, we need this since hardware acceleration does not work.
  # environment.variables.LIBGL_ALWAYS_SOFTWARE = "1";
  # Lots of stuff that uses aarch64 that claims doesn't work, but actually works.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  system.stateVersion = "22.05";
}
