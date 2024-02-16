{
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = [
        "amdgpu"
      ];
    };

    # Delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;
  };
}
