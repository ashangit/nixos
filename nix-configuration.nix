{ config, ... }:

{
  # nix.conf
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.optimise.dates = ["10:00"];
  nix.gc.automatic = true;
  nix.gc.dates = "11:00";
}
