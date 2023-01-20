{
nixpkgs,
self,
...
}: let
   inputs = self.inputs;
   nixpkgs-f2k = inputs.nixpkgs-f2k;
   system = "x86_64-linux";
   homeManager = inputs.home-manager.nixosModules.home-manager;

   home-manager = {
	useUserPackages = true;
	useGlobalPkgs = true;
	extraSpecialArgs = {
      	    inherit inputs;
            inherit self;
        };
	users.emxry = ../modules/home;
    };
   hosts.nixosModule = {
	networking.stevenBlackHosts = {
		enable = true;
		blockFakenews = true;
		blockGambling = true;
		blockPorn = true;
		blockSocial = true;
	};
   };
   in {
	io = nixpkgs.lib.nixosSystem {
		inherit system;
		modules = [
		    ./io/configuration.nix
		    homeManager
		    { inherit home-manager; }
		    {
		      nixpkgs.overlays = [
			nixpkgs-f2k.overlays.window-managers
			nixpkgs-f2k.overlays.compositors
		      ];
		      specialArgs = {inherit inputs;};
		    }
		];
	};

	ultra = nixpkgs.lib.nixosSystem {
		inherit system;
		modules = [
		    ./ultra/configuration.nix
		    homeManager
		    { inherit home-manager; }
		    {
		      nixpkgs.overlays = [
		        nixpkgs-f2k.overlays.window-managers
			nixpkgs-f2k.overlays.compositors
		      ];
		    }
		];
		specialArgs = { inherit inputs; };
	};
}
