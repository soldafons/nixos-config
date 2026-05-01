# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable mullvad
  services.mullvad-vpn.enable = true;
  # Enable earlyOOM
  services.earlyoom.enable = true;


  # Systemd tweaks
  systemd.services.NetworkManager-wait-online.enable = false;
  boot.initrd.systemd.enable = true;
  systemd.services.nix-gc.wantedBy = [ ];
  

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";



  # Desktop
  services.displayManager.ly = {
    enable = true;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];


  # Install packages
  environment.systemPackages = with pkgs; [
  ghostty
  nushell
  librewolf
  telegram-desktop
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
  awww
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
  ripgrep
  jetbrains.pycharm-oss
  aria2
  btop
  uv
  xwayland-satellite
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
