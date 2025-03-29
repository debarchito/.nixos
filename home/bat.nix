{
  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin-mocha";
    };
  };
  xdg.configFile."bat/themes/catppuccin-mocha.tmTheme".source = ./bat/catppuccin-mocha.tmTheme;
}
