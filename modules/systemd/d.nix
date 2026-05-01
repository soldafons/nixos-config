{ ... }: {
  systemd.services = {
    NetworkManager-wait-online.enable = false;
    nix-gc.wantedBy = [ ];
  };
  boot.initrd.systemd = {
    enable = true;
  };
}
