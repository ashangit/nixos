{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./network.nix
    ./video.nix
    ./audio.nix
    ./bluetooth.nix
    ./printer.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    mcelog.enable = true;
    enableAllFirmware = true;
  };

  # Firmware update
  services.fwupd.enable = true;
}
