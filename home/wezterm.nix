{ fontSize ? 14, opacity ? "0.8", ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      return {
      	font = wezterm.font_with_fallback({
      		"Cascadia Code PL",
      		"FiraCode Nerd Font Mono",
      		"LXGW WenKai Mono",
      	}),
      	font_size = fontSize,
      	enable_tab_bar = false,
      	window_background_opacity = ${opacity},
      	window_padding = {
      		left = 0,
      		right = 0,
      		top = 5,
      		bottom = 0,
      	},
      	cursor_blink_ease_in = "Constant",
      	cursor_blink_ease_out = "Constant",
      	color_scheme = "Dracula",
      }
    '';
  };

}
