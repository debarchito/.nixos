{ lib, config, ... }:

{
  options.trusted-substituters.enable = lib.mkEnableOption "enable pulling binary caches from trusted substituters";

  config = lib.mkIf config.trusted-substituters.enable {
    nix.settings = {
      substituters = [
        "https://devenv.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
