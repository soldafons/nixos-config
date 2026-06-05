{
  boot.tmp.cleanOnBoot = true;

  preservation = {
    enable = true;

    preserveAt."/persist" = {
      files = [
	      { file = "/etc/machine-id"; inInitrd = true; }
      ];

      directories = [
        "/var/log"
	      "/var/lib/nixos"
	      "/var/lib/systemd" 
        "/var/lib/sbctl"
        "/var/cache/mullvad-vpn"
        "/etc/mullvad-vpn"
      ];

      users.soldafon = {
	      directories = [
	        "dotfiles"
	        "Downloads"
          ".ssh"
          ".config/vesktop"
	        ".local/share/zoxide"
          ".local/share/Steam"
          ".local/share/Terraria"
          ".local/share/PrismLauncher"
          "python"
	      ];

	      files = [
	        ".config/nushell/history.txt"
	      ];
      };
    };
  };
}
