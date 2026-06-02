{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      nvim-cmp
      nvim-autopairs
      nvim-web-devicons
      gitsigns-nvim
    ];
    initLua = ''
      vim.opt.number = true
      vim.opt.signcolumn = "yes"
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.termguicolors = true
      vim.opt.cursorline = true
      vim.opt.swapfile = false
      vim.opt.wrap = false
      vim.opt.undofile = true
    '';
  };
}
