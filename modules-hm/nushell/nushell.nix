{ config, ... }: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = /home/soldafon/.config/nushell/config.nu;
      settings = {
        show_banner = false;
        buffer_editor = "nvim";
      };
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
