{pkgs, ...}: {
  hardware.sane = {
    # Scanner configuration
    enable = true;
    extraBackends = [pkgs.sane-airscan];
  };
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns = true;
    };
  };
}
