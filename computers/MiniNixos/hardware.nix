{
  config,
  lib,
  ...
}: {
  boot = {
    kernelModules = ["kvm-intel" "wl"];
    extraModulePackages = [config.boot.kernelPackages.broadcom_sta];

    initrd = {
      availableKernelModules = ["ohci_pci" "ehci_pci" "ahci" "firewire_ohci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci"];
    };
  };

  hardware = {
    cpu.intel.updateMicrocode =
      lib.mkDefault
      config.hardware.enableRedistributableFirmware;
    nvidia.modesetting.enable = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a6d81448-9537-487d-a48c-7f4026a6a447";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/A7B1-FFE0";
      fsType = "vfat";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/7cc1d14b-35be-4074-b2f3-15c0bded1fff";
      fsType = "ext4";
    };
  };
  swapDevices = [
    {device = "/dev/disk/by-uuid/be009220-7fd0-4f81-abc7-a91963d039c5";}
  ];
}
