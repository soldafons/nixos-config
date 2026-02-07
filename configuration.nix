# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  security.pki.certificateFiles = [];
  services.openssh.enable = true;
  security.pki.installCACerts = true;

  environment.variables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    NIX_SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  nix.settings.ssl-cert-file =
    "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";

  services.resolved.enable = true;
  services.resolved.fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
  # opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # nvidia
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = false;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.powerManagement.enable = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  # steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # enable unfree pkgs
  nixpkgs.config.allowUnfree = true;
  # enable mullvad
  services.mullvad-vpn.enable = true;
  # install fonts
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  _0xproto
  nerd-fonts.fantasque-sans-mono
];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "repeater"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  hardware.bluetooth.enable = true;
  services.zerotierone.enable = true;
  # hamachi
  programs.haguichi.enable = true;
  # razer
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
  services.desktopManager.plasma6.enable = true;
  programs.hyprland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.soldafon = {
    isNormalUser = true;
    description = "soldafon";
    extraGroups = [ "networkmanager" "wheel" "plugdev"];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  kitty
  librewolf
  telegram-desktop
  mullvad-vpn
  vlc
  fastfetch
  cmatrix
  cowsay
  gparted
  libreoffice
  python314
  javaPackages.compiler.temurin-bin.jre-21
  fortune
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
  haguichi
  logmein-hamachi
  razer-cli
  razergenie
  vulkan-tools
  bottles
  zerotierone
  (waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    })
  )
  mako
  libnotify
  swww
  rofi
  networkmanagerapplet
  grim
  slurp
  wl-clipboard
  zip
  unzip
  killall
  ];

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
  system.stateVersion = "25.11"; # Did you read the comment?

}
