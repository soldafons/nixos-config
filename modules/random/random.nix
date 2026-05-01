
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  # Enable mullvad
  services.mullvad-vpn.enable = true;
  # Install packages
  environment.systemPackages = with pkgs; [
  ghostty
  librewolf
  telegram-desktop
  vlc
  fastfetch
  libreoffice
  python314
  javaPackages.compiler.temurin-bin.jre-21
  yazi
  vesktop
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
  jetbrains.pycharm-oss
  aria2
  btop
  uv
  xwayland-satellite
  ];
}
