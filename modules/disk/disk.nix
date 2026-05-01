{ ... }: {
  fileSystems = {
    "/" = {
      fsType = "btrfs";
      options = [
        "subvol=@"
        "noatime"
        "compress=zstd:3"
        "space_cache=v2"
      ];
    };
    "/home" = {
      options = [
        "noatime"
        "compress=zstd:3"
        "space_cache=v2"
      ];
    };
  };
}
