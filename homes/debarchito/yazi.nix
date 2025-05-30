{ lib, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs.external.yazi;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    plugins = {
      full-border = pkgs.yaziPlugins.full-border;
      no-status = pkgs.yaziPlugins.no-status;
      yatline = pkgs.yaziPlugins.yatline;
      yatline-catppuccin = pkgs.yaziPlugins.yatline-catppuccin;
    };
    initLua = ./yazi/init.lua;
    settings = {
      mgr.ratio = [
        2
        2
        5
      ];
    };
  };
  xdg.configFile."yazi/theme.toml".source = lib.mkForce ./yazi/theme.toml;
  xdg.configFile."yazi/Catppuccin-mocha.tmTheme".source = lib.mkForce ./yazi/Catppuccin-mocha.tmTheme;
}
