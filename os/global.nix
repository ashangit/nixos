{
  imports = [
    ./sysctl.nix
    ./env.nix
    ./locale.nix
    ./documentation.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure console keymap
  console.keyMap = "fr";
}
