{ pkgs, ... }:

{

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Scanner configuration
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  # Define printers
  #hardware.printers.ensurePrinters = [
  #  {
  #    name = "XeroxC235-2";
  #    description = "Xerox C235";
  #    deviceUri = "ipp://192.168.1.33";
  #    model = "/etc/nixos/hardware/xrxC235.ppd";
  #    ppdOptions = { PageSize = "A4"; };
  #  }
  #];
}