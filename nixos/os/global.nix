{
  imports = [
      ./boot.nix
      ./sysctl.nix
      ./locale.nix
      ./documentation.nix
  ];

  # Delete all files in /tmp during boot.
  boot.tmp.cleanOnBoot = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure console keymap
  console.keyMap = "fr";
}