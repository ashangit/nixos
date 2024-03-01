{pkgs, ...}: {
  imports = [
    ./programs.nix
    ./container.nix
    ./logiops.nix
    ./tlp.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "mailspring-1.12.0"
    "openssl-1.1.1w"
  ];

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # ---------------------------------------------------------------------
    # Archive
    # ---------------------------------------------------------------------

    gzip
    xz
    zip
    zstd

    # ---------------------------------------------------------------------
    # Editor
    # ---------------------------------------------------------------------

    sublime4 # https://www.sublimetext.com/

    # ---------------------------------------------------------------------
    # Mail
    # ---------------------------------------------------------------------

    mailspring

    # ---------------------------------------------------------------------
    # Office utilities
    # ---------------------------------------------------------------------

    libreoffice
    libsForQt5.merkuro # Calendar: https://github.com/KDE/merkuro
    libsForQt5.skanlite # Scanner: https://github.com/KDE/skanlite

    # ---------------------------------------------------------------------
    # Others Utilities
    # ---------------------------------------------------------------------

    fzf
    gparted
    jq
    libcgroup
    libsForQt5.bluedevil # bluetooth manager
    libsForQt5.plasma-systemmonitor # system monitor
    pavucontrol # sound control
    pciutils
    rsync
    wget

    # ---------------------------------------------------------------------
    # Photo
    # ---------------------------------------------------------------------

    digikam # https://github.com/KDE/digikam

    # ---------------------------------------------------------------------
    # Video
    # ---------------------------------------------------------------------

    libsForQt5.kdenlive # Video editor: https://github.com/KDE/kdenlive
    vlc

    # ---------------------------------------------------------------------
    # Video Conf
    # ---------------------------------------------------------------------

    skypeforlinux
    zoom-us

    # ---------------------------------------------------------------------
    # Security
    # ---------------------------------------------------------------------

    bitwarden
    pinentry-qt
    gnupg
  ];
}
