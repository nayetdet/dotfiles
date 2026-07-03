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
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    mkNixosConfiguration = profile: user: theme: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit self inputs profile user theme; };
      modules = [
        (self + /hosts/${profile}/default.nix)
        home-manager.nixosModules.home-manager {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = { inherit self inputs profile user theme; };
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
      } {
        color = "blue";
        folderColor = "blue";
        iconTheme = "Papirus-Dark";
      };

      laptop = mkNixosConfiguration "laptop" {
        name = "nayetdet";
        description = "João Pedro Moreira";
      } {
        color = "red";
        folderColor = "black";
        iconTheme = "Papirus-Dark";
      };
    };

    devShells.${system} = {
      agents = import (self + /shells/agents.nix) { inherit pkgs; };
    };
  };
}
