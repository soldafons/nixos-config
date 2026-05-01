{ ... }: {
  imports = [
    ./audio/audio.nix
    ./boot/boot.nix
    ./disk/disk.nix
    ./fonts/fonts.nix
    ./garbage/gc.nix
    ./hardware/hardware.nix
    ./home/home.nix
    ./network/network.nix
    ./personal/personal.nix
    ./steam/steam.nix
    ./nixos/nixos.nix
    ./desktop/desktop.nix
    ./systemd/d.nix
    ./random/random.nix
  ];
}

