{ config, pkgs, ... }:

{
  imports =
  [
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # editor
    sublime4
    vim
    # photo
    digikam
    # mail
    mailspring
    # video
    glaxnimate
    vlc
    # kde
    libsForQt5.kdenlive
    libsForQt5.merkuro
    # security
    bitwarden
    gnupg
    pinentry-qt
    # web
    firefox
    # others
    libreoffice
    wget
  ];
}
