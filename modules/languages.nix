{ inputs, ... }:
{
  imports = [
    "${inputs.remote-repo}/modules/cpp.nix"
    "${inputs.remote-repo}/modules/python.nix"
  ];
}
