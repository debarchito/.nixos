{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.vm = {
    enable = lib.mkEnableOption "enable vm module";
    kvm.enable = lib.mkEnableOption "enable kvm";
  };

  config = lib.mkMerge [
    {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
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
    }

    (lib.mkIf config.vm.kvm.enable {
      virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
    })
  ];
}
