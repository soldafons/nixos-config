{ pkgs, config, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # System version
  system.stateVersion = "25.11";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
