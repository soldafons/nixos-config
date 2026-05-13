{ ... }: {
  wayland.windowManager.mango = {
    # Enable mango
    enable = true;
    # Autostart
    autostart_sh = ''
      awww-daemon --format xrgb &
      awww img ~/Pictures/Wallpapers/ua_field1.jpg &
      nm-applet --indicator &
      waybar &
      mako &
    '';
  };
}
