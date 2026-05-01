{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      _0xproto
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["_0xproto"];
        sansSerif = ["_0xproto"];
        monospace = ["_0xproto"];
      };
    };
  };
}
