{
  # nix.conf
  nix = {
    settings = {
      auto-optimise-store = true;
    };
    optimise = {
      automatic = true;
      dates = ["10:00"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      randomizedDelaySec = "14m";
      options = "--delete-older-than 10d";
    };
  };
}
