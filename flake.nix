{
  description = "Nayetdet's Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nautilus-my-computer = {
      url = "github:yannmasoch/nautilus-my-computer?dir=packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      systems = nixpkgs.lib.unique (map (host: host.system) (builtins.attrValues hosts));
      hosts = nixpkgs.lib.mapAttrs mkHost {
        desktop = { };
        laptop = { };
      };

      mkHost =
        id: overrides:
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
        } overrides
        // {
          inherit id;
        };

      mkConfiguration =
        host:
        nixpkgs.lib.nixosSystem {
          inherit (host) system;
          specialArgs = { inherit self inputs host; };
          modules = [
            (self + /hosts/${host.id}/default.nix)
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = { inherit self inputs host; };
                users.${host.user.username} = import (self + /home/${host.id}/default.nix);
                backupFileExtension = "backup";
              };
            }
          ];
        };
    in
    {
      formatter = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      checks = nixpkgs.lib.genAttrs systems (
        system:
        import ./checks.nix {
          pkgs = nixpkgs.legacyPackages.${system};
          src = self;
        }
      );

      nixosConfigurations = nixpkgs.lib.mapAttrs (_: mkConfiguration) hosts;
    };
}
