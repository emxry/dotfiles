{
config,
pkgs,
lib,
...
}:{
  xdg.configFile.nvim = {
	source = ./config;
	recursive = true;
  };
  programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
         vimPlugins.packer-nvim 
	 zig
      ];
  };
}
