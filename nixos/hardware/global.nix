{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./filesystems.nix
    ./network.nix
    ./audio.nix
    ./bluetooth.nix
    ./printer.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    mcelog.enable = true;
    enableAllFirmware = true;
  };

  # Firmware update
  services.fwupd.enable = true;
}
