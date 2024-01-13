{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   tlp
  ];

  # Systemd services
  services = {
    power-profiles-daemon.enable = false; # conflicts with services.tlp.enable = true;
    tlp = {
      enable = true;
      settings = {
        TLP_ENABLE = 1;
        # Seconds laptop mode has to wait after the disk goes idle before doing a sync.
        # Non-zero value enables, zero disables laptop mode.
        DISK_IDLE_SECS_ON_AC = 0;
        DISK_IDLE_SECS_ON_BAT = 2;
        # Dirty page values (timeouts in secs).
        MAX_LOST_WORK_SECS_ON_AC = 15;
        MAX_LOST_WORK_SECS_ON_BAT = 60;
        # Select a CPU frequency scaling governor.
        # Intel Core i processor with intel_pstate driver:
        #   powersave(*), performance
        # Older hardware with acpi-cpufreq driver:
        #   ondemand(*), powersave, performance, conservative, schedutil
        # (*) is recommended.
        # Hint: use tlp-stat -p to show the active driver and available governors.
        # Important:
        #   You *must* disable your distribution's governor settings or conflicts will
        #   occur. ondemand is sufficient for *almost all* workloads, you should know
        #   what you're doing!
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        # Set CPU energy/performance policies EPP and EPB:
        #   performance, balance_performance, default, balance_power, power.
        # Values are given in order of increasing power saving.
        # Requires:
        # * Intel CPU
        #   EPP: Intel Core i 6th gen. or newer CPU with intel_pstate driver
        #   EPB: Intel Core i 2nd gen. or newer CPU with intel_pstate driver
        #     as of kernel 5.2; alternatively module msr and
        #     x86_energy_perf_policy from linux-tools
        #   EPP and EPB are mutually exclusive: when EPP is available, Intel CPUs
        #   will not honor EPB. Only the matching feature will be applied by TLP.
        # * AMD Zen 2 or newer CPU
        #   EPP: amd-pstate driver in active mode ('amd-pstate-epp') as of kernel 6.3
        # Default: balance_performance (AC), balance_power (BAT)
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        # Set the CPU "turbo boost" (Intel) or "turbo core" (AMD) feature:
        #   0=disable, 1=allow.
        # Allows to raise the maximum frequency/P-state of some cores if the
        # CPU chip is not fully utilized and below it's intended thermal budget.
        # Note: a value of 1 does *not* activate boosting, it just allows it.
        # Default: <none>
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        # Set Intel/AMD CPU dynamic boost feature:
        #   0=disable, 1=enable.
        # Improve performance by increasing minimum P-state limit dynamically
        # whenever a task previously waiting on I/O is selected to run.
        # Requires:
        # * Intel Core i  6th gen. or newer CPU: intel_pstate driver in active mode
        # * AMD Zen 2 or newer CPU: amd-pstate driver in active mode ('amd-pstate-epp')
        #   provided by a yet unreleased kernel 6.x
        # Default: <none>
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        # Select platform profile:
        #   performance, balanced, low-power.
        # Controls system operating characteristics around power/performance levels,
        # thermal and fan speed. Values are given in order of increasing power saving.
        # Note: check the output of tlp-stat -p to determine availability on your
        # hardware and additional profiles such as: balanced-performance, quiet, cool.
        # Default: <none>
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        # Select I/O scheduler for the disk devices.
        # Multi queue (blk-mq) schedulers:
        #   mq-deadline(*), none, kyber, bfq
        # Single queue schedulers:
        #   deadline(*), cfq, bfq, noop
        # (*) recommended.
        # Separate values for multiple disks with spaces. Use the special value 'keep'
        # to keep the kernel default scheduler for the particular disk.
        # Notes:
        # - Multi queue (blk-mq) may need kernel boot option 'scsi_mod.use_blk_mq=1'
        #   and 'modprobe mq-deadline-iosched|kyber|bfq' on kernels < 5.0
        # - Single queue schedulers are legacy now and were removed together with
        #   the old block layer in kernel 5.0
        # Default: keep
        DISK_IOSCHED = "mq-deadline mq-deadline";
      };
    };
  };
}
