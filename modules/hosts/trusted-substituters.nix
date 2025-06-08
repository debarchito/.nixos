{ lib, config, ... }:

{
  options.trusted-substituters.enable = lib.mkEnableOption "enable pulling binary caches from trusted substituters";

  config = lib.mkIf config.trusted-substituters.enable {
    nix.settings = {
      substituters = [
        "https://catppuccin.cachix.org"
        "https://devenv.cachix.org"
        "https://debarchito.cachix.org"
        "https://helix.cachix.org"
        "https://nix-community.cachix.org"
        "https://yazi.cachix.org"
      ];
      trusted-public-keys = [
        "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "debarchito.cachix.org-1:b9I9LSdMFockuXyfljPeoIcJtIVopf9rVkvkIG20PGg="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      ];
    };
  };
}
