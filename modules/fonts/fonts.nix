{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      _0xproto
      nerd-fonts.jetbrains-mono
    ];
  };
}
