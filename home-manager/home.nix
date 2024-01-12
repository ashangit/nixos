{ config, pkgs, ... }:

{
  imports =
  [
    ./git.nix
  ];

  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "nfraison";
    homeDirectory = "/home/nfraison";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      pkgs.gitprompt-rs
      pkgs.rustup
      pkgs.jetbrains.dataspell
      pkgs.jetbrains.goland
      pkgs.jetbrains.idea-ultimate
      pkgs.jetbrains.pycharm-professional
      pkgs.jetbrains.rust-rover
      pkgs.jetbrains.webstorm
      pkgs.dbeaver
      pkgs.sqlitebrowser
    ];

  };

  # Whether to enable GNU Bourne-Again SHell.
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      sessionVariables = {
        EDITOR = "vi";
        PS1 = "\\n\\[\\033[1;32m\\][\\[\\e]0;\\u@\\h: \\w\\a\\]\\u@\\h:\\w]\\[\\033[0m\\]\\$(gitprompt-rs)\\$ ";
      };
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
