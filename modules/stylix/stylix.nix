{ pkgs, ... }: {
  stylix = {
    enable = true;
    base16Scheme = ./themes/base2tone-drawbridge.yaml;
    image = /home/soldafon/Pictures/Wallpapers/Drawbridge/lake1.png;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      serif = {
        package = pkgs._0xproto;
        name = "0xProto NL";
      };
      sansSerif = {
        package = pkgs._0xproto;
        name = "0xProto NL";
      };
      monospace = {
        package = pkgs._0xproto;
        name = "0xProto NL";
      };
      emoji = {
        package = pkgs.twitter-color-emoji;
        name = "Twitter Color Emoji";
      };
    };
  };
}
