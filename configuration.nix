# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };
  # Enable ZRam
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };
  # Microcode + firmware
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  # CPU governor
  powerManagement.cpuFreqGovernor = "performance";
  # Fix for NVIDIA GPU drivers not being able to install
  security.pki.certificateFiles = [];
  services.openssh.enable = true; # Enable OpenSSH daemon
  security.pki.installCACerts = true;

  environment.variables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    NIX_SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  nix.settings.ssl-cert-file =
    "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";

  services.resolved.enable = true;
  services.resolved.settings.Resolve.FallbackDNS = [ "1.1.1.1" "8.8.8.8" ];
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # NVIDIA GPU drivers setup
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = false;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.powerManagement.enable = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  # Steam tweaks
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  # Disk tweaks
  fileSystems."/" = {
    fsType = "btrfs";
    options = [
      "subvol=@"
      "noatime"
      "compress=zstd:3"
      "space_cache=v2"
    ];
  };

  fileSystems."/home".options = [
    "noatime"
    "compress=zstd:3"
    "space_cache=v2"
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable mullvad
  services.mullvad-vpn.enable = true;
  # Enable earlyOOM
  services.earlyoom.enable = true;
  # Font setup
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      _0xproto
      nerd-fonts.fantasque-sans-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["_0xproto"];
        sansSerif = ["_0xproto"];
        monospace = ["_0xproto"];
      };
    };
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true; # Enable Plymouth
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "splash"
    "nowatchdog"
    "idle=nomwait"
  ];
  # Systemd tweaks
  systemd.services.NetworkManager-wait-online.enable = false;
  boot.initrd.systemd.enable = true;
  systemd.services.nix-gc.wantedBy = [ ];
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen; # Use the Zen kernel

  networking.hostName = "repeater"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  hardware.bluetooth.enable = true; # Enable bluetooth
  services.zerotierone.enable = true; # Enable zerotier
  # Open-Razer setup
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["soldafon"];
  hardware.rtl-sdr.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable Hyprland
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.soldafon = {
    isNormalUser = true;
    shell = pkgs.nushell;
    description = "soldafon";
    extraGroups = [ "networkmanager" "wheel" "plugdev"];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };


  # Install packages
  environment.systemPackages = with pkgs; [
  kitty
  ghostty
  nushell
  librewolf
  telegram-desktop
  mullvad-vpn
  vlc
  fastfetch
  libreoffice
  python314
  javaPackages.compiler.temurin-bin.jre-21
  yazi
  wget
  git
  curl
  vim
  vesktop
  pnpm
  prismlauncher
  protonup-ng
  mangohud
  krita
  gimp
  neovim
  openssl
  razer-cli
  razergenie
  vulkan-tools
  zerotierone
  (waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    })
  )
  mako
  libnotify
  swww
  wofi
  networkmanagerapplet
  grim
  slurp
  wl-clipboard
  zip
  unzip
  bat
  tree
  tealdeer
  hyprpicker
  rustc
  cargo
  gtk4
  revolt-desktop
  sbctl
  ripgrep
  inotify-tools
  inotify-info
  jetbrains.pycharm
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };

  # List services that you want to enable:

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
  system.stateVersion = "25.11"; # Did you read the comment?

}
