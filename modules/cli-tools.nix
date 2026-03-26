{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    bat
    dust
    duf
    (writeShellApplication {
      name = "clip";
      runtimeInputs = [ coreutils ];
      text = builtins.readFile "${inputs.repo-root}/configs/commands/clip.sh";
    })
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 50%"
      "--layout=reverse"
      "--border"
      "--inline-info"
    ];
    fileWidgetCommand = "rg --files --hidden --follow --glob '!.git/*'";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=header,grid --line-range :100 {}'"
    ];
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
