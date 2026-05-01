{ inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.soldafon.imports = [
      inputs.mangowm.hmModules.mango
      /home/soldafon/dotfiles/nixdots/modules-hm
    ];
    backupFileExtension = "backup";
  };
}
