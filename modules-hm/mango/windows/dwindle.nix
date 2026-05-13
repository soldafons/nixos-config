{ ... }: {
  wayland.windowManager.mango.settings = {
    tagrule = [
      "id:1,layout_name:dwindle"
      "id:2,layout_name:dwindle"
      "id:3,layout_name:dwindle"
    ];
    dwindle = {
      split_ratio=0.5;
      smart_split=0;
      hsplit=0;
      vsplit=0;
      preserve_split=0;
      smart_resize=0;
      drop_simple_split=0;
    };
  };
}
