{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  system.stateVersion = "24.11"; # DO NOT CHANGE!

  # Some Nix-related settings.
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # Cachix
  nix.settings = {
    substituters = [
      "https://ezkea.cachix.org"
      "https://devenv.cachix.org"
      "https://chaotic-nyx.cachix.org"
    ];
    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };

  # Boot stuff.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-c6aca288-6a62-4c22-8fc2-949a4a9c7bad".device =
    "/dev/disk/by-uuid/c6aca288-6a62-4c22-8fc2-949a4a9c7bad";
  boot.extraModprobeConfig = "options kvm_intel nested=1";
  # Switch to default kernel due to regressions
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # services.scx.enable = true;g

  # Networking stuff.
  networking = {
    hostName = "dell";
    networkmanager.enable = true;
    firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };

  # Bluetooth stuff.
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  # Localization stuff.
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Dislay Manager stuff.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.libinput.enable = true;
  programs.xwayland.enable = true;

  # NVIDIA stuff.
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # OpenGL stuff.
  hardware.graphics.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Me!
  users.users.debarchito = {
    isNormalUser = true;
    description = "Debarchito Nath";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "bluetooth"
      "libvirtd"
    ];
  };

  # Podman stuff.
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # Libvirtd
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
}
