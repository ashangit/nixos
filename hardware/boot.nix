{
  boot = {
    extraModulePackages = [];

    kernelModules = ["kvm-amd"];

    initrd = {
      availableKernelModules = [
        "nvme"
        "ehci_pci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [
        "amdgpu"
      ];
    };

    # Bootloader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;

    plymouth = {
      enable = true;
      theme = "spinner";
    };
  };
}
