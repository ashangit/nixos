{pkgs, ...}: {
  imports = [
    /etc/nixos/common.nix
    ./hardware.nix
  ];

  networking.hostName = "T14SNixos";

  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];

  # KDE
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      layout = "fr";
      xkbVariant = "";
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm = {
        enable = true;
        theme = "chili";
        autoNumlock = true;
      };
      desktopManager.plasma5.enable = true;
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    konsole
    oxygen
    plasma-browser-integration
  ];
}
