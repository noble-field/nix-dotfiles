{ inputs, ... }:
{
  imports = [
    "${inputs.repo-root}/modules/cpp.nix"
    "${inputs.repo-root}/modules/python.nix"
  ];
}
