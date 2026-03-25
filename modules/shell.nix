{ config, pkgs, inputs, ... }:

{
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    history = {
      size = 1000;
      save = 1000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreAllDups = true;
      share = true;
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent =
      builtins.readFile "${inputs.remote-repo}/configs/zsh/.zshrc" +
      "\n" +
      builtins.readFile "${inputs.remote-repo}/configs/zsh/fzf.zsh";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;
      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold green) ";
        disabled = false;
      };
      username = {
        show_always = true;
        format = "[$user](bold blue) ";
        disabled = false;
      };
      time = {
        disabled = false;
        format = "🕙 [$time]($style) ";
        time_format = "%H:%M:%S";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
      };
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $- == *i* ]]; then
        export SHELL="${pkgs.zsh}/bin/zsh"
        exec "${pkgs.zsh}/bin/zsh" -l
      fi
    '';
  };

  home.sessionVariables = {
    LESS_TERMCAP_mb = "\\e[1;32m";
    LESS_TERMCAP_md = "\\e[1;32m";
    LESS_TERMCAP_me = "\\e[0m";
    LESS_TERMCAP_se = "\\e[0m";
    LESS_TERMCAP_so = "\\e[01;33m";
    LESS_TERMCAP_ue = "\\e[0m";
    LESS_TERMCAP_us = "\\e[1;4;31m";
  };

  home.shellAliases = {
    grep = "grep --color=auto";
    find = "fd";
    cat = "bat";
    pcat = "bat -p";
    du = "dust";
    df = "duf";
    ls = "eza --icons=always";
    ll = "eza -l --icons=always --git";
    la = "eza -la --icons=always --git";
    tree = "eza -T --icons=always";
    fzf-preview = "fzf --preview 'bat --color=always --style=header,grid --line-range :100 {}'";
  };
}
