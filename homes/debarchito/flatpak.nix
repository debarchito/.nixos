{ lib, ... }:

{
  services.flatpak = {
    enable = true;
    remotes = lib.mkOptionDefault [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [ ];
    update.auto.enable = true;
    update.auto.onCalendar = "daily";
  };
}
