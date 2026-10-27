{
  description = "Nayetdet's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkHost = id: overrides:
        nixpkgs.lib.recursiveUpdate {
          system = "x86_64-linux";
          stateVersion = "26.05";

          user = {
            username = "nayetdet";
            name = "João Pedro Moreira";
          };

          theme = {
            theme = "blue";
            folderTheme = "blue";
            iconTheme = "Papirus-Dark";
          };
        } overrides // { inherit id; };

      mkConfiguration = host: nixpkgs.lib.nixosSystem {
        system = host.system;
        specialArgs = { inherit self inputs host; };
        modules = [
          (self + /hosts/${host.id}/default.nix)
          home-manager.nixosModules.home-manager {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = { inherit self inputs host; };
              users.${host.user.username} = import (self + /home/${host.id}/default.nix);
              backupFileExtension = "backup";
            };
          }
        ];
      };
    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs
        (id: overrides: mkConfiguration (mkHost id overrides)) {
          desktop = { };
          laptop = { };
        };
    };
}
