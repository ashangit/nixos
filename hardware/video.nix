{pkgs, ...}: {
  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    # ---------------------------------------------------------------------
    # OpenCL
    # ---------------------------------------------------------------------

    clinfo
    glxinfo
  ];
}
