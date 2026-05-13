{ pkgs, ... }: {
  programs.quickshell = {
    enable = true;
    configs = {
      ukraine = ./qs-conf/ukraine;
      drawbridge = ./qs-conf/drawbridge;
    };
    activeConfig = "drawbridge";
  };
}
