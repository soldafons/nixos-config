{ ... }: {
  imports = [
    ./audio/audio.nix
    ./boot/boot.nix
    ./disk/disk.nix
    ./fonts/fonts.nix
    ./home/home.nix
    ./network/network.nix
    ./personal/personal.nix
    ./steam/steam.nix
    ./desktop/desktop.nix
    ./systemd/systemd.nix
    ./random/random.nix
    ./tools/tools.nix
    ./stylix/stylix.nix
    ./peripherals
  ];
}

