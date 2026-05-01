{ pkgs, lib, ... }: {
  environment.systemPackages = [ pkgs.sbctl ];
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    kernelParams = [
      "quiet"
      "loglevel=3"
      "splash"
      "nowatchdog"
      "idle=nomwait"
      "nvidia-drm.modeset=1"
    ];  
  };
}
