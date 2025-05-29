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
    packages = [
      "com.usebottles.bottles"
      "it.mijorus.gearlever"
      "io.github.flattool.Warehouse"
    ];
    update.auto.enable = true;
    update.auto.onCalendar = "daily";
  };
}
