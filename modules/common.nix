{ inputs, ... }:

{
  imports = [
    "${inputs.repo-root}/modules/shell.nix"
    "${inputs.repo-root}/modules/tmux.nix"
    "${inputs.repo-root}/modules/nvim.nix"
    "${inputs.repo-root}/modules/git.nix"
    "${inputs.repo-root}/modules/cli-tools.nix"
  ];
}
