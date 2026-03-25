{ pkgs, lib, config, ... }:

{
  options.languages = {
    cpp.enable = lib.mkEnableOption "C++ environment and LSP";
  };

  config = lib.mkIf config.languages.cpp.enable {
    home.packages = with pkgs; [
      gcc
      gnumake
      gdb
    ];

    programs.neovim.extraPackages = with pkgs; [
      clang-tools
    ];

    programs.neovim.initLua = lib.mkAfter ''
      vim.lsp.config.clangd = {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
      }
      vim.lsp.enable('clangd')
    '';
  };
}
