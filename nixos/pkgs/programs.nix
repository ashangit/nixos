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
      keybindings =  true;
    };
    htop.enable = true;
    iftop.enable = true;
    iotop.enable = true;
    vim.defaultEditor = true;

   # pinentry-program /run/current-system/sw/bin/pinentry
    gnupg.agent.enable =  true;
  };
}
