{
  description = "A simple NixOS flake";

    # NixOS official package source, using the nixos-25.11 branch here
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # nix-sweep
  inputs.nix-sweep.url = "github:jzbor/nix-sweep";
  # home manager
  inputs.home-manager.url = github:nix-community/home-manager;

  outputs = { self, nixpkgs, nix-sweep, ... }@attrs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.repeater = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        /home/soldafon/dotfiles/configuration.nix
      ];
    };
  };
}
