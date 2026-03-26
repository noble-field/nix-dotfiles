{ inputs, ... }:
{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "25.11";

  imports = [
    "${inputs.repo-root}/modules/common.nix"
    "${inputs.repo-root}/modules/languages.nix"
  ];

  languages = {
    cpp = {
      enable = true;
    };
    python = {
      enable = true;
    };
  };

  programs.home-manager.enable = true;
}
