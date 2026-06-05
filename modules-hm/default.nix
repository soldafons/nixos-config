{ ... }: {
  imports = [
    ./mango
    ./nushell/nushell.nix
    ./home/hm.nix
    ./quickshell/quickshell.nix
    ./stylix/stylix.nix
    ./neovim/nvim.nix
    ./ghostty
    ./git/git.nix
  ];
}
