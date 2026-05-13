{ pkgs, ... }: {
  services = {
    displayManager.ly = {
      enable = true;
    };
  };
  programs = {
    mango = {
      enable = true;
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
}
