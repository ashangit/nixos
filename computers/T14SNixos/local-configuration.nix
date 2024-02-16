{pkgs, ...}: let
  sddm-chili-theme = pkgs.sddm-chili-theme.overrideAttrs rec {
    src = pkgs.fetchFromGitHub {
      owner = "ashangit";
      repo = "sddm-chili";
      rev = "e55697de19ad981a7aa86db0807686cc5ae84b12";
      sha256 = "LdZCfhOHyaQJAhPLt/9a1eCJO1uw2T4bo2Irg1bUvzk=";
    };
  };
in {
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
      videoDrivers = ["amdgpu"];
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
