{ config, ... }: {
  programs = {
    nushell = {
      enable = true;
      settings = {
        show_banner = false;
        buffer_editor = "nvim";
      };
      extraConfig = ''
        cd ~/dotfiles/nixdots
      '';
      shellAliases = {
        cd = "z";
        cat = "bat";
        lsl = "ls -l";
        ga = "git add -A";
        gp = "git push";
        nhn = "nh os switch ~/dotfiles/nixdots -H repeater_nv --impure";
        nhs = "nh os switch ~/dotfiles/nixdots -H repeater --impure";
        nhb = "nh os boot ~/dotfiles/nixdots -H repeater --impure";
      };
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
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
