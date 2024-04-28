{...}: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c4f5e094-ede7-4f58-9c8a-145cad9f10ac";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/2E7B-AE18";
      fsType = "vfat";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/88238382-ad73-4063-9f79-ed75c8d71fb8";
      fsType = "ext4";
    };
  };

  swapDevices = [];
}
