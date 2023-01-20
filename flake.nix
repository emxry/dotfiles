{
  inputs = {
	nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
	nixpkgs-f2k.url = github:fortuneteller2k/nixpkgs-f2k;
	hosts.url = github:StevenBlack/hosts;
	home-manager = {
	    url = github:nix-community/home-manager; 
	    inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs = { self, ... }@inputs:
  	let 
	  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
	  system = "x86_64-linux";
	  config = {
	      system = system;
	      allowUnfree = true;
	  };
	in {
	nixosConfigurations = import ./hosts inputs;
  };
}
