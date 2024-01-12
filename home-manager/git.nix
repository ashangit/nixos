{
  # Global git config
  programs = {
    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        github.user = "ashangit";
        user = {
          email = "nfraison@yahoo.fr";
          name = "Nicolas Fraison";
        };
      };
      ignores = [
        ".idea"
      ];
    };
  };
 }
