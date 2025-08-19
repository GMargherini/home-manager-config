{
  description = "Home Manager configuration of dolphin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @ { nixpkgs, home-manager, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations = {
      	specialArgs = { inherit inputs; };
	      mainframe = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./configuration.nix
			home-manager.nixosModules.home-manager {
			  home-manager.useGlobalPkgs = true;
			  home-manager.useUserPackages = true;
			  home-manager.users.dolphin = ./home/home.nix;
			  home-manager.backupFileExtension = "bak";
			  home-manager.extraSpecialArgs = { inherit inputs; };
			}
		];

	      };
      };
    };
}
