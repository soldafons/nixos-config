
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  librewolf
  fastfetch
  javaPackages.compiler.temurin-bin.jre-21
  vesktop
  prismlauncher
  gimp
  razer-cli
  razergenie
  awww
  grim
  slurp
  wl-clipboard
  uv
  xwayland-satellite
  ];
}
