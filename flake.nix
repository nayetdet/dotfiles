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
    mkNixosConfiguration = host: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit self inputs host; };
      modules = [
        (self + /hosts/${host.id}/default.nix)
        home-manager.nixosModules.home-manager {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = { inherit self inputs host; };
            users.${host.user.name} = import (self + /home/${host.id}/default.nix);
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs
      (id: host: mkNixosConfiguration (host // { inherit id; }))
      {
        desktop = {
          stateVersion = "26.05";
          user = {
            name = "nayetdet";
            description = "João Pedro Moreira";
          };

          theme = {
            color = "blue";
            folderColor = "blue";
            iconTheme = "Papirus-Dark";
          };
        };

        laptop = {
          stateVersion = "26.05";
          user = {
            name = "nayetdet";
            description = "João Pedro Moreira";
          };

          theme = {
            color = "red";
            folderColor = "black";
            iconTheme = "Papirus-Dark";
          };
        };
      };
  };
}
