{
pkgs,
config,
...
}:{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
  	kitty
	xfce.thunar
	xfce.thunar-volman
	fzf
	fish
	starship
	lxappearance
	rofi
	rofi-power-menu
	dunst
        
        # Python
        python3

	# Fonts
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	(nerdfonts.override {
	    fonts = [
	        "JetBrainsMono"
                "Iosevka"
	   ];
	})
  ];
}
