# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  amdgpu-kernel-module = pkgs.callPackage ./amdgpu-kernel-module.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };
  # linuxPackages_latest 6.13 (or linuxPackages_zen 6.13)
  amdgpu-stability-patch = pkgs.fetchpatch {
    name = "amdgpu-stability-patch";
    url = "https://github.com/SeryogaBrigada/linux/commit/d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3.diff";
    hash = "sha256-q/gWUPmKHFBHp7V15BW4ixfUn1kaeJhgDs0okeOGG9c=";
  };
  /*
  # linuxPackages_zen 6.12
  amdgpu-stability-patch = pkgs.fetchpatch {
    name = "amdgpu-stability-patch-zen";
    url = "https://github.com/zen-kernel/zen-kernel/compare/fd00d197bb0a82b25e28d26d4937f917969012aa...WhiteHusky:zen-kernel:f4c32ca166ad55d7e2bbf9adf121113500f3b42b.diff";
    hash = "sha256-bMT5OqBCyILwspWJyZk0j0c8gbxtcsEI53cQMbhbkL8=";
  };
  */
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "options hid_apple fnmode=2";
  boot.kernelParams = [
    "video=DP-1:3840x2160@60"
    "video=DP-2:3840x2160@60"
    "video=HDMI-A-1:3840x2160@60"
  ];
  boot.initrd.kernelModules = ["amdgpu"];
  # amdgpu instability with context switching between compute and graphics
  # https://bbs.archlinux.org/viewtopic.php?id=301798
  # side-effects: plymouth fails to show at boot, but does not interfere with booting
  #boot.extraModulePackages = [
  #  (amdgpu-kernel-module.overrideAttrs (_: {
  #    patches = [
  #      # amdgpu-stability-patch
  #    ];
  #  }))
  #];
  security.polkit.enable = true;
  networking.hostName = "mainframe"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.cosmic.enable = false;
  
  services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  services.displayManager.ly.settings = {
    animation = "matrix";
    bigclock = "en";
  };

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dolphin = {
    isNormalUser = true;
    description = "Dolphin";
    extraGroups = [ "networkmanager" "wheel" "input" "adbusers" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    ly
    hyprpolkitagent
    neovim
    gcc
    zig
    rustup
    uutils-coreutils-noprefix
    zip
    unzip
    pmbootstrap
    file
    pwvucontrol
  ];

  fonts.packages = with pkgs; [ 
    nerd-fonts.fira-code
    fira-code-symbols
  ];
  
  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    harfbuzzFull
    SDL2
    skia
    glfw
    libsoundio
  ];
  programs.partition-manager.enable = true;
  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;
  programs.adb.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  virtualisation.docker.enable = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
