{ ... }: {
  systemd.services = {
    NetworkManager-wait-online.enable = false;
    systemd-machine-id-commit.enable = false;
    nix-gc.wantedBy = [ ];
  };
  boot.initrd.systemd = {
    enable = true;
  };
}
