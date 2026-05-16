{ pkgs, config, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable nh 
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/soldafon/dotfiles/nixdots";
  };
  # System version
  system.stateVersion = "25.11";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
