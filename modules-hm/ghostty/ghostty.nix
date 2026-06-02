{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Drawbridge";
      font-size = 11;
      font-family = "0xProto NL";
      mouse-hide-while-typing = true;
      window-decoration = false;
    };
  };
}
