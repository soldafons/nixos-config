
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  librewolf
  telegram-desktop
  fastfetch
  python314
  javaPackages.compiler.temurin-bin.jre-21
  vesktop
  prismlauncher
  protonup-ng
  mangohud
  gimp
  openssl
  razer-cli
  razergenie
  zerotierone
  mako
  awww
  wofi
  networkmanagerapplet
  grim
  slurp
  wl-clipboard
  btop
  uv
  xwayland-satellite
  ];
}
