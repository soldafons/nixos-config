{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "soldafon";
  home.homeDirectory = "/home/soldafon";

  home.packages = with pkgs; [
    cowsay
    fortune
    cmatrix
  ];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs = {
    nushell = { enable = true;
      configFile.source = /home/soldafon/.config/nushell/config.nu;
      settings = {
        show_banner = false;
      };
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = { enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
