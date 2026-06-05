{
  description = "The Flakening";

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
    # mangowm
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # lix
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    preservation = { 
      url = "github:nix-community/preservation";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-parts, home-manager, lanzaboote, mangowm, stylix, lix, lix-module, preservation, disko, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          repeater_nv = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };

            modules = [
              ./hosts/repeater_nv
              home-manager.nixosModules.home-manager
              lanzaboote.nixosModules.lanzaboote
              mangowm.nixosModules.mango
              stylix.nixosModules.stylix
              lix-module.nixosModules.default
            ];
          };
          repeater = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };

            modules = [
              ./hosts/repeater
              home-manager.nixosModules.home-manager
              lanzaboote.nixosModules.lanzaboote
              mangowm.nixosModules.mango
              stylix.nixosModules.stylix
              lix-module.nixosModules.default
	            disko.nixosModules.disko
	            preservation.nixosModules.default
            ];
          };
        };
      };
      systems = [
        "x86_64-linux"
      ];
    };
}

