{
  # nix.conf
  nix = {
    settings = {
      auto-optimise-store = true;
    };
    optimise = {
      automatic = true;
      dates = ["daily"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    persistent = true;
  };
}
