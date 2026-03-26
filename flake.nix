{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    repo-root = {
      url = "path:.";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    homeConfigurations = {

      "ubuntu-server" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ "${inputs.repo-root}/users/ubuntu-server.nix"];
      };

      "starlight" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ "${inputs.repo-root}/users/starlight.nix"];
      };

    };
  };
}
