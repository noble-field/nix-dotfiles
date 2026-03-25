{ pkgs, lib, config, ... }:

{
  options.languages = {
    python.enable = lib.mkEnableOption "python environment and LSP";
  };

  config = lib.mkIf config.languages.python.enable {
    home.packages = with pkgs; [
      (python311.withPackages (ps: with ps; [
        numpy
        requests
        matplotlib
      ]))
    ];

    programs.neovim.extraPackages = with pkgs; [
      pyright
    ];

    programs.neovim.initLua = lib.mkAfter ''
      vim.lsp.config.pyright = {
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            }
          }
        }
      }
      vim.lsp.enable('pyright')
    '';
  };
}
