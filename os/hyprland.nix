{pkgs, ...}: {
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
}