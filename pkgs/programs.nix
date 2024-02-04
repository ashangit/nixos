{
  programs = {
    bcc.enable = true;
    firefox = {
      enable = true;
      languagePacks = [
        "fr"
        "en-US"
      ];
    };
    fzf = {
      fuzzyCompletion = true;
      keybindings = true;
    };
    git.enable = true;
    htop.enable = true;
    iftop.enable = true;
    iotop.enable = true;
    vim.defaultEditor = true;
    gnupg.agent.enable = true;
    dconf.enable = true;
  };
}
