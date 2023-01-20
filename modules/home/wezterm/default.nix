{
   programs.wezterm = {
	enable = true;
	extraConfig = ''
	local wezterm = require 'wezterm'

	return {
	    font = wezterm.font('Iosevka Nerd Font', { weight = 'Medium', italic = true }),
	    font_size = 11.0,
	    color_scheme = "OneDark (Gogh)",
	    default_cursor_style = "BlinkingBar",
	}
	'';
   };
}
