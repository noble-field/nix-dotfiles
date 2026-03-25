{ inputs, ... }:
{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "25.11";

  imports = [
    "${inputs.remote-repo}/modules/common.nix"
    "${inputs.remote-repo}/modules/languages.nix"
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
