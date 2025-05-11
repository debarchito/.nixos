{ inputs, ... }:

{
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig;
  # DO NOT USE THESE TO MANAGE THE GAMES, ONLY LAUNCH!
  # Use HoyoPlay to manage the games.
  programs.honkers-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
}
