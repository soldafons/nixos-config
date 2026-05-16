{ ... }: {
  wayland.windowManager.mango.settings = {
    # Border
    border = {
      radius = 20;
    };
    borderpx = 3; # border outline
    focuscolor = "0x289dbdff"; # Active border colour
    bordercolor = "0x4961daff"; # Inactive border colour
    # Blur
    blur = 1;
    blur_params = {
      radius = 4;
      num_passes = 1;
    };
    # Gaps
    gappih = 6;
    gappiv = 6;
    gappoh = 10;
    # Transparency
    focused_opacity = 0.9;
    unfocused_opacity = 0.75;
    # Shadows
    shadows = 0;
  };
}
