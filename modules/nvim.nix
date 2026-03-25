{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes
      fzf-vim
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile "${inputs.remote-repo}/configs/nvim/nvim-tree.lua";
      }
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip
    ];

    extraPackages = with pkgs; [
      nil
    ];

    initLua = builtins.readFile "${inputs.remote-repo}/configs/nvim/init.lua";
  };

}
