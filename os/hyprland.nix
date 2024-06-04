{pkgs, ...}: {
  hardware.brillo.enable = true;

  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
    hyprland.xwayland.enable = true;
  };

  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "fr";
        variant = "";
      };
      videoDrivers = ["amdgpu"];
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      theme = "Utterly-Nord";
      wayland.enable = true;
      autoNumlock = true;
    };
    hypridle.enable = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpaper
    hyprpicker
    poweralertd
    swaynotificationcenter
    wlogout
    xdg-desktop-portal-hyprland

    libsForQt5.qt5ct
    libsForQt5.bluedevil # bluetooth manager
    libsForQt5.plasma-systemmonitor # system monitor
    pavucontrol # sound control
    utterly-nord-plasma # KDE theme (SDDM, wallpaper...)
    wofi
  ];
}
