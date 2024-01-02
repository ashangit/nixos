{
  # Global git config
  programs.git.enable = true;
  programs.git.config = {
    init = {
      defaultBranch = "main";
    };
    user = {
      email = "nfraison@yahoo.fr";
      name = "Nicolas Fraison";
    };
  };
 }
