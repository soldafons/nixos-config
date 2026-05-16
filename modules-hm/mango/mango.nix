{ ... }: {
  wayland.windowManager.mango = {
    # Enable mango
    enable = true;
    # Languages
    settings = {
      xkb_rules = {
        layout = "us,ua";
        options = "grp:alt_shift_toggle";
      };
      cursor = {
        size = 24;
        theme = "Bibata-Modern-Ice";
      };
    };
    # Autostart
    autostart_sh = ''
      awww-daemon --format xrgb &
      awww img ~/Pictures/Wallpapers/lake1.png &
      nm-applet --indicator &
      qs -c drawbridge &
      mako &
    '';
  };
}
