{ ... }: {
  wayland.windowManager.mango.settings.bind = [
    # Open
    "SUPER,q,spawn,ghostty" # Terminal
    "SUPER,s,spawn,wofi --show drun"
    "SUPER,1,spawn,steam"
    "SUPER,2,spawn,vesktop"
    "SUPER,3,spawn,prismlauncher"
    "SUPER,4,spawn,librewolf"
    # Use tools
    "SUPER,p,spawn,sh -c \"grim -g '$(slurp)' - | wl-copy\""
    "SUPER,c,killclient"
    "SUPER,f,togglefullscreen"
    # Config
    "SUPER,m,quit"
    "SUPER,r,reload_config"
    # Window
    # Workspace
    "SUPER,f1,comboview,1"
    "SUPER,f2,comboview,2"
    "SUPER,f3,comboview,3"
  ];
}
