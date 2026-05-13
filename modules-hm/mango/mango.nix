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
    };
    # Autostart
    autostart_sh = ''
      awww-daemon --format xrgb &
      awww img ~/Pictures/Wallpapers/ua_field1.jpg &
      nm-applet --indicator &
      qs -c drawbridge &
      mako &
    '';
  };
}
