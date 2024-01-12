{ pkgs, ... }:

{
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      layout = "fr";
      xkbVariant = "";
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    oxygen
    plasma-browser-integration
  ];
}
