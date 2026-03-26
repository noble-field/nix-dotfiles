{ pkgs, inputs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 50;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'moon'
          set -g @tmux_power_prefix_highlight_pos 'LR'
        '';
      }
      prefix-highlight
      yank
      resurrect
    ];

    extraConfig = builtins.readFile "${inputs.repo-root}/configs/tmux/.tmux.conf";
  };
}
