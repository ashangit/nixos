{pkgs, ...}: {
  systemd.packages = with pkgs; [
    pkgs.logiops
    pkgs.poweralertd
    pkgs.swaynotificationcenter
  ];
}
