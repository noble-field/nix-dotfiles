{ inputs, ... }:

{
  imports = [
    "${inputs.remote-repo}/modules/shell.nix"
    "${inputs.remote-repo}/modules/tmux.nix"
    "${inputs.remote-repo}/modules/nvim.nix"
    "${inputs.remote-repo}/modules/git.nix"
    "${inputs.remote-repo}/modules/cli-tools.nix"
  ];
}
