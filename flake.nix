{
  inputs = {
	nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
	nixpkgs-f2k.url = github:fortuneteller2k/nixpkgs-f2k;
	hosts.url = github:StevenBlack/hosts;
	home-manager.url = github:nix-community/home-manager;
	nyoom-src = {
	  url = "github:nyoom-engineering/nyoom.nvim";
	  flake = false;
	};
  };
  outputs = { self, nixpkgs, nixpkgs-f2k, home-manager, hosts, nyoom-src, ... }:
  	let 
	  system = "x86_64-linux";
	  config = {
	      system = system;
	      allowUnfree = true;
	  };
	in {
	  nixosConfigurations.io = nixpkgs.lib.nixosSystem {
	  	inherit system;
		modules = [
			{
				nixpkgs.overlays = [
					
					nixpkgs-f2k.overlays.window-managers
					nixpkgs-f2k.overlays.compositors
				];
			}
			hosts.nixosModule {
				networking.stevenBlackHosts = {
					enable = true;
					blockFakenews = true;
					blockGambling = true;
					blockPorn = true;
					blockSocial = true;
				};
			}
			home-manager.nixosModules.home-manager
			{
			    home-manager = {
				useUserPackages = true;
				useGlobalPkgs = true;
				users.emxry = ./modules/home/home.nix;
			    };
			}
			./hosts/io/configuration.nix
			./hosts/io/hardware-configuration.nix
		];
	};
  };
}
