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
      awww img /home/soldafon/dotfiles/nixdots/assets/wallpapers/lake1.png
      qs -c drawbridge &
    '';
  };
}
