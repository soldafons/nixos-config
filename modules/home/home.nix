{ inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.soldafon.imports = [
      inputs.mangowm.hmModules.mango
      ../../modules-hm
    ];
    backupFileExtension = "backup";
  };
}
