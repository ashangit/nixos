{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   tlp
  ];

  # Systemd services
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        TLP_ENABLE = 1;
        DISK_IDLE_SECS_ON_AC = 0;
        DISK_IDLE_SECS_ON_BAT = 2;
        MAX_LOST_WORK_SECS_ON_AC = 15;
        MAX_LOST_WORK_SECS_ON_BAT = 60;
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        DISK_IOSCHED = "mq-deadline mq-deadline";
      };
    };
  };
}
