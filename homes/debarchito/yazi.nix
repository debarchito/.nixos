{ pkgs, lib, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    plugins = {
      duckdb = pkgs.yaziPlugins.duckdb;
      full-border = pkgs.yaziPlugins.full-border;
      no-status = pkgs.yaziPlugins.no-status;
      yatline = pkgs.yaziPlugins.yatline;
      yatline-catppuccin = pkgs.yaziPlugins.yatline-catppuccin;
    };
    initLua = ./yazi/init.lua;
  };
  xdg.configFile."yazi/yazi.toml".source = lib.mkForce ./yazi/yazi.toml;
  xdg.configFile."yazi/theme.toml".source = lib.mkForce ./yazi/theme.toml;
  xdg.configFile."yazi/catppuccin-mocha.tmTheme".source = lib.mkForce ./yazi/catppuccin-mocha.tmTheme;
}
