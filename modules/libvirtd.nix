{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.libvirtd.enable = lib.mkEnableOption "enable libvirtd module";

  config = lib.mkIf config.libvirtd.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
  };
}
