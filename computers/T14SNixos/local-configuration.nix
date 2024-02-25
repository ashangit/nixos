{pkgs, ...}: {
  imports = [
    /etc/nixos/common.nix
    ./hardware.nix
  ];

  networking.hostName = "T14SNixos";

  # KDE
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      layout = "fr";
      xkbVariant = "";
      videoDrivers = ["amdgpu"];
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
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

  hardware.brillo.enable = true;

  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    waybar.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprpicker
    swaylock
    xdg-desktop-portal-hyprland
  ];
}
