{
  users = {
    # Groups
    groups.family = {};

    # Users
    users = {
      nfraison = {
        isNormalUser = true;
        description = "Nicolas Fraison";
        home = "/home/nfraison";
        extraGroups = ["networkmanager" "wheel" "family" "docker" "scanner" "lp"];
      };

      mherson = {
        isNormalUser = true;
        description = "Magali Herson";
        home = "/home/mherson";
        extraGroups = ["networkmanager" "wheel" "family" "scanner" "lp"];
      };
    };
  };
}
