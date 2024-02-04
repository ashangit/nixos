let
  username = "nfraison";
  fullname = "Nicolas Fraison";
  email = "${username}@yahoo.fr";
  home = "/home/${username}";
  githubUsername = "ashangit";
in {
  users.users.nfraison = {
    isNormalUser = true;
    description = fullname;
    home = home;
    extraGroups = ["networkmanager" "wheel" "family" "docker" "scanner" "lp"];
  };

  home-manager.users.nfraison = {pkgs, ...}: {
    home = {
      # Home Manager needs a bit of information about you and the paths it should
      # manage.
      username = username;
      homeDirectory = home;

      # The home.packages option allows you to install Nix packages into your
      # environment.
      packages = with pkgs; [
        # ---------------------------------------------------------------------
        # Database
        # ---------------------------------------------------------------------

        dbeaver
        sqlitebrowser

        # ---------------------------------------------------------------------
        # IDE
        # ---------------------------------------------------------------------

        jetbrains.dataspell
        jetbrains.goland
        jetbrains.idea-ultimate
        jetbrains.pycharm-professional
        jetbrains.rust-rover
        jetbrains.webstorm

        # ---------------------------------------------------------------------
        # Dev utilities
        # ---------------------------------------------------------------------

        gitprompt-rs
        rustup
      ];

      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update the value, then make sure to first check the Home Manager
      # release notes.
      stateVersion = "23.11"; # Please read the comment before changing.
    };

    # Whether to enable GNU Bourne-Again SHell.
    programs = {
      alacritty = {
        enable = true;
        settings = {
          font.size = 7;
          scrolling.history = 100000;
          window = {
            decorations = "Full";
            startup_mode = "Maximized";
          };
        };
      };
      bash = {
        enable = true;
        enableCompletion = true;
        sessionVariables = {
          PS1 = "\\n\\[\\033[1;32m\\][\\[\\e]0;\\u@\\h: \\w\\a\\]\\u@\\h:\\w]\\[\\033[0m\\]\\$(gitprompt-rs)\\$ ";
        };
      };
      git = {
        enable = true;
        extraConfig = {
          init.defaultBranch = "main";
          github.user = githubUsername;
          user = {
            email = email;
            name = fullname;
          };
        };
        ignores = [
          ".idea"
        ];
      };

      # Let Home Manager install and manage itself.
      home-manager.enable = true;
    };
  };
}
