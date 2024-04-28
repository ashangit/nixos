let
  unstable = import (fetchTarball "channel:nixpkgs-unstable") {};
in
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
      "openssl-1.1.1w"
    ];

    security.pam.services.swaylock = {};

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
      # Database
      # ---------------------------------------------------------------------

      dbeaver
      sqlitebrowser

      # ---------------------------------------------------------------------
      # IDE
      # ---------------------------------------------------------------------

      unstable.jetbrains.clion
      unstable.jetbrains.goland
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains.pycharm-professional
      unstable.jetbrains.rust-rover
      unstable.jetbrains.webstorm

      # ---------------------------------------------------------------------
      # Editor
      # ---------------------------------------------------------------------

      sublime4 # https://www.sublimetext.com/

      # ---------------------------------------------------------------------
      # Mail
      # ---------------------------------------------------------------------

      unstable.mailspring

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
      gitprompt-rs
      gnumake
      gparted
      jq
      libcgroup
      pciutils
      rsync
      wget

      # ---------------------------------------------------------------------
      # Photo
      # ---------------------------------------------------------------------

      digikam # https://github.com/KDE/digikam
      krita

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
