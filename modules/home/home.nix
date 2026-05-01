{ inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.soldafon.imports = [
      inputs.mangowc.hmModules.mango
      /home/soldafon/dotfiles/nixdots/modules-hm
    ];
    backupFileExtension = "backup";
  };
}
