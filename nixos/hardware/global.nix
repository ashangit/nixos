# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./audio.nix
    ./bluetooth.nix
    ./network.nix
    ./printer.nix
  ];
  
  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" =  {
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

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0f3u1u1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Firmware update
  services.fwupd.enable = true;
}
