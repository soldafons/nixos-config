{ config, ... }: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = /home/soldafon/.config/nushell/config.nu;
      settings = {
        show_banner = false;
        buffer_editor = "nvim";
      };
      shellAliases = {
        cat = "bat";
        cd = "z";
        lsl = "ls -l";
        ga = "git add -A";
        gp = "git push";
        nhs = "nh os switch ~/dotfiles/nixdots --impure";
      };
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[ >](bold green)";
          error_symbol = "[ >](bold red)";
        };
      };
    };
  };
}
