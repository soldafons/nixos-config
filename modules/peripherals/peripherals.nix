{ ... }: {
  hardware = {
    openrazer = {
      enable = true;
      users = [ "soldafon" ];
    };
    rtl-sdr.enable = true;
  };
}
