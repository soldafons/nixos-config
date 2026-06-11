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
    mullvad-vpn.enable = true;
  };
}
