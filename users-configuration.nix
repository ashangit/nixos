{ config, pkgs, ... }:

{
  # Groups
  users.groups.family = {};

  # Users
  users.users.nfraison = {
    isNormalUser = true;
    description = "Nicolas Fraison";
    home = "/home/nfraison";
    extraGroups = [ "networkmanager" "wheel" "family" "docker" ];
  };
  
  users.users.mherson = {
    isNormalUser = true;
    description = "Magali Herson";
    home = "/home/mherson";
    extraGroups = [ "networkmanager" "wheel" "family" ];
    packages = with pkgs; [
    ];
  };
}
