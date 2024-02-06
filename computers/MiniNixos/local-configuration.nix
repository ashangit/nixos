{
  imports = [
    /etc/nixos/common.nix
    ./hardware.nix
  ];

  networking.hostName = "MiniNixos";

  # Hyprland
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      layout = "fr";
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
      };
    };
  };
  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
  };
}
