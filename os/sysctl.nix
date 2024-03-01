{
  boot.kernel.sysctl = {
    # Network
    "net.ipv4.tcp_sack" = 1;
    "net.core.rmem_default" = 16777216;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_default" = 16777216;
    "net.core.wmem_max" = 16777216;
    # Memory
    "vm.swappiness" = 1;
    "vm.vfs_cache_pressure" = 50;
    # FS
    "fs.file-max" = 500000;
  };
}
