{
  description = "A simple NixOS flake";

  inputs = {
    # Use unstable packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, ...}: {
    nixosConfigurations = {
      repeater = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
	        ./configuration.nix
          home-manager.nixosModules.home-manager
          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              pkgs.sbctl
            ];

	        home-manager = {
	          useGlobalPkgs = true;
	          useUserPackages = true;
	          users.soldafon = ./home.nix;
            backupFileExtension = "backup"; 
	        };

          boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
        ];
      };
    };
  };
}

