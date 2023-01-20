{
pkgs,
...
}:{
  
  imports = [
      ./packages.nix
      # I strongly recommend you don't remove the extra packages file as it contains useful utilities
      ./extra_packages.nix
      ./fish
      ./wezterm
  ];

  # Home-Manager config
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  
  # Configure fonts in home-manager
  fonts.fontconfig.enable = true;
}
