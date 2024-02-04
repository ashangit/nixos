{
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = [];
    };

    plymouth.enable = true;

    # Delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;
  };
}
