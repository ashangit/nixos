{pkgs, ...}: {
  imports = [
    ./hardware/global.nix
    ./os/global.nix
    ./nix-configuration.nix
    ./pkgs/global.nix
    ./users/global.nix
    <home-manager/nixos>
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
  };

  environment.systemPackages = with pkgs; [
    nerdfonts
    hyprpaper
    hyprpicker
    swayidle
    swaylock-effects
    wlogout
    xdg-desktop-portal-hyprland

    pavucontrol # sound control
    libsForQt5.qt5ct
    libsForQt5.bluedevil # bluetooth manager
    libsForQt5.plasma-systemmonitor # system monitor
    wofi
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
