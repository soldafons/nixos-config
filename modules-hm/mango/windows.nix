{ ... }: {
  wayland.windowManager.mango.settings = {
    # Border
    border_radius = 3;
    focuscolor = "0x005bbbff"; # Active border colour
    bordercolor = "cc0000ff"; # Inactive border colour
    # Blur
    blur = 1;
    blur_params = {
      radius = 5;
      num_passes = 1;
    };
    # Gaps
    # Transparency
    focused_opacity = 0.9;
    unfocused_opacity = 0.75;
    # Shadows
    shadows = 0;
  };
}
