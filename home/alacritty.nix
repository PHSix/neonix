{ fontName ? "Cascadia Code PL", fontSize ? 11, opacity ? 0.87, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      env.TERM = "alacritty";
      window = {
        dimensions = {
          columns = 82;
          lines = 25;
        };
        dynamic_title = true;
        startup_mode = "Windowed";
        decorations = "full";
        opacity = opacity;
      };
      cursor.style = {
        shape = "Block";
        blinking = "off";
      };

      font = {
        normal = {
          family = fontName;
          style = "Medium";
        };
        italic = {
          family = fontName;
          style = "Italic";
        };
        bold = {
          family = fontName;
          style = "Bold";
        };
        bold_italic = {
          family = fontName;
          style = "Bold Italic";
        };
        size = fontSize;
      };
    };
  };
}
