{
  description = "Nayetdet's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    mkNixosConfiguration = profile: user: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self inputs profile user; };
      modules = [
        (self + /hosts/${profile}/default.nix)
        home-manager.nixosModules.home-manager {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = { inherit self inputs profile user; };
            users.${user.name} = import (self + /home/${profile}/default.nix);
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      desktop = mkNixosConfiguration "desktop" {
        name = "nayetdet";
        description = "João Pedro Moreira";
      };
    };
  };
}
