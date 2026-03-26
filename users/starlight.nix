
{ inputs, ... }:
{
  imports = [
    "${inputs.repo-root}/users/ubuntu-server.nix"
  ];
  
  home.file = {
    "docker/adguard-home/docker-compose.yml".source =
      "${inputs.repo-root}/dockerfiles/adguard-home.yml";
  };
}
