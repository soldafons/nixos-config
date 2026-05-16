{ ... }: {
  wayland.windowManager.mango.settings = {
    animations = 1;
    layer_animations = 1;
    animation = {
      duration = {
        move = 300;
        open = 250;
        tag = 250;
        close = 250;
        focus = 0;
      };
      curve = {
        move = "0.16,1.0,0.3,1.0";
        open = "0.16,1.0,0.3,1.0";
        tag = "0.16,1.0,0.3,1.0";
        close = "0.16,1.0,0.3,1.0";
        focus = "0.16,1.0,0.3,1.0";
        opafadein = "0.16,1.0,0.3,1.0";
        opafadeout = "0.16,1.0,0.3,1.0";
      };
    };
  };
}
