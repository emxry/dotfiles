{
config,
pkgs,
...
}:{
  programs.fish = {
  	enable = true;
	loginShellInit = "set fish_greeting";
	shellAliases = {
	    ls = "exa --icons -l";
	    helix = "hx";
	};
  };
  programs.starship = {
	enable = true;
	enableFishIntegration = true;
  };
}
