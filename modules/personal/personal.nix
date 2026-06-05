{ pkgs, ... }: {
  # User account
  users.users.soldafon = {
    isNormalUser = true;
    hashedPasswordFile = "/persist/passwords/soldafon";
    shell = pkgs.nushell;
    description = "soldafon";
    extraGroups = [ "networkmanager" "wheel" "plugdev"]; # plugdev is for razer setup
  };
  users.mutableUsers = false;
  # turn off lecture
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults lecture=never , timestamp_timeout=30
    '';
  };
  # Time zone
  time.timeZone = "Europe/Kyiv";
  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };
}
