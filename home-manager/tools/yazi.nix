{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ./yazi/yazi.toml;
  xdg.configFile."yazi/theme.toml".source = ./yazi/theme.toml;
  xdg.configFile."yazi/catppuccin-mocha.tmTheme".source = ./yazi/catppuccin-mocha.tmTheme;
}
