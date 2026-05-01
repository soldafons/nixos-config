{ ... }: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
  services = {
    resolved = {
      enable = true;
      settings = {
        Resolve.FallbackDNS = [ "1.1.1.1" "8.8.8.8" ];
      };
    };
    zerotierone.enable = true;
    openssh.enable = true;
  };
  hardware.bluetooth.enable = true; # Enable bluetooth
  security.pki.installCACerts = true;
}
