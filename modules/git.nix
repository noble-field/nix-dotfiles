{ pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Shun Kida";
        email = "creative.spider.2013@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };

  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = builtins.readFile "${inputs.repo-root}/configs/nvim/gitsigns-nvim.lua";
    }
  ];

  programs.lazygit = {
    enable = true;
  };
}
