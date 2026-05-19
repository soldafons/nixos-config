{
  description = "A simple NixOS flake";

  inputs = {
    # Use unstable packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Flake parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    # Install homemanager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Install lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # mangow
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-parts, home-manager, lanzaboote, mangowm, stylix, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          repeater = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };

            modules = [
              ./modules
              home-manager.nixosModules.home-manager
              lanzaboote.nixosModules.lanzaboote
              mangowm.nixosModules.mango
              stylix.nixosModules.stylix
            ];
          };
        };
      };
      systems = [
        "x86_64-linux"
      ];
    };
}

