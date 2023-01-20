{
config,
pkgs,
...
}:{
  programs.kitty = {
	enable = true;
	extraConfig = import ./colors/quixotic.nix;
	settings = {
	    confirm_os_window_close = "0";
	    font_family = "Iosevka Medium Italic Nerd Font Complete";
	    font_size = "12.0";
	};
  };
}
