let
  username = "nfraison";
  fullname = "Nicolas Fraison";
  email = "${username}@yahoo.fr";
  home = "/home/${username}";
  githubUsername = "ashangit";
in {
  users.users.nfraison = {
    isNormalUser = true;
    description = fullname;
    home = home;
    extraGroups = [
      "docker"
      "input"
      "lp"
      "networkmanager"
      "scanner"
      "video"
      "wheel"
    ];
  };

  home-manager.users.nfraison = {pkgs, ...}: {
    home = {
      # Home Manager needs a bit of information about you and the paths it should
      # manage.
      username = username;
      homeDirectory = home;

      # The home.packages option allows you to install Nix packages into your
      # environment.
      packages = with pkgs; [
        # ---------------------------------------------------------------------
        # Database
        # ---------------------------------------------------------------------

        dbeaver
        sqlitebrowser

        # ---------------------------------------------------------------------
        # IDE
        # ---------------------------------------------------------------------

        jetbrains.clion
        jetbrains.dataspell
        jetbrains.goland
        jetbrains.idea-ultimate
        jetbrains.pycharm-professional
        jetbrains.rust-rover
        jetbrains.webstorm

        # ---------------------------------------------------------------------
        # Dev utilities
        # ---------------------------------------------------------------------

        gitprompt-rs
        rustup
      ];

      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update the value, then make sure to first check the Home Manager
      # release notes.
      stateVersion = "23.11"; # Please read the comment before changing.
    };

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      xwayland.enable = true;

      settings = {
        # See https://wiki.hyprland.org/Configuring/Monitors/
        monitor = [
          "desc:AU Optronics 0x573D,1920x1080@60,0x0,1"
          "desc:Iiyama North America PL2792Q 1152123902028,2560x1440@60,1920x0,1"
          "desc:Iiyama North America PL2792Q 1152104703888,2560x1440@60,4480x0,1"
        ];

        # Some default env vars.
        env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct" # change to qt6ct if you have that
        ];

        # See https://wiki.hyprland.org/Configuring/Variables/#general
        general = {
          gaps_in = 1; # gaps between windows
          gaps_out = 0; # gaps between windows and monitor edges
          cursor_inactive_timeout = 5; # in seconds, after how many seconds of cursor’s inactivity to hide it. Set to 0 for never.
          resize_on_border = true; # enables resizing windows by clicking and dragging on borders and gaps
          extend_border_grab_area = 30; # extends the area around the border where you can click and drag on, only used when general:resize_on_border is on.
          allow_tearing = false; # master switch for allowing tearing to occur. See https://wiki.hyprland.org/Configuring/Tearing/.
        };

        # See https://wiki.hyprland.org/Configuring/Variables/#decoration
        decoration = {
          rounding = 10; # rounded corners’ radius (in layout px)
          dim_inactive = true; # enables dimming of inactive windows
          dim_strength = 0.2; # how much inactive windows should be dimmed [0.0 - 1.0]

          # https://wiki.hyprland.org/Configuring/Performance/#how-do-i-make-hyprland-draw-as-little-power-as-possible-on-my-laptop
          drop_shadow = false; # enable drop shadows on windows
          blur.enabled = false; # enable kawase window background blur
        };

        # See https://wiki.hyprland.org/Configuring/Variables/#animations / https://wiki.hyprland.org/Configuring/Animations/
        animations = {};

        # See https://wiki.hyprland.org/Configuring/Variables/#input
        input = {
          kb_layout = "fr"; # Appropriate XKB keymap parameter
          numlock_by_default = true; # Engage numlock by default.

          follow_mouse = 1; # Specify if and how cursor movement should affect window focus. See the note below. [0/1/2/3]

          # https://wiki.hyprland.org/Configuring/Variables/#touchpad
          touchpad = {
            disable_while_typing = false; # Disable the touchpad while typing.
            tap-and-drag = true; # Sets the tap and drag mode for the touchpad
          };

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };

        # https://wiki.hyprland.org/Configuring/Variables/#gestures
        gestures = {
          workspace_swipe = true; # enable workspace swipe gesture
          workspace_swipe_fingers = 4; # how many fingers for the gesture
          workspace_swipe_invert = false; # invert the direction
          workspace_swipe_forever = true;
        };

        # https://wiki.hyprland.org/Configuring/Dwindle-Layout
        dwindle = {
          smart_split = true; # if enabled, allows a more precise control over the window split direction based on the cursor’s position. The window is conceptually divided into four triangles, and cursor’s triangle determines the split direction. This feature also turns on preserve_split.
        };

        # https://wiki.hyprland.org/Configuring/Variables/#misc
        misc = {
        };

        # https://wiki.hyprland.org/Configuring/Variables/#xwayland
        xwayland.force_zero_scaling = true;

        # https://wiki.hyprland.org/Configuring/Keywords/
        "$mainMod" = "SUPER";

        # https://wiki.hyprland.org/Configuring/Binds/
        bind = [
          "$mainMod, A, exec, alacritty"
          "$mainMod, C, killactive,"
          "$mainMod, Q, exit,"
          "$mainMod, E, exec, dolphin"
          "$mainMod, F, exec, firefox"
          "$mainMod, P, exec, pycharm-professional"
          "$mainMod, S, exec, sublime"
          "$mainMod, V, togglefloating,"
          "$mainMod, J, togglesplit," # dwindle

          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod,TAB,workspace,e-1"
          "ALT_L,TAB,workspace,e+1"
        ];

        bindl = [
          # trigger when the switch is toggled
          #",switch:[switch name],exec,swaylock"
          # trigger when the switch is turning on
          ",switch:on:[switch name],exec,hyprctl keyword monitor \"eDP-1,1920x1080@60,0x0,1\""
          # trigger when the switch is turning off
          ",switch:off:[switch name],exec,hyprctl keyword monitor \"eDP-1,disable\""
        ];

        bindel = [
          # Brightness keys mapping
          ", XF86MonBrightnessDown, exec, brillo -U 5"
          ", XF86MonBrightnessUp, exec, brillo -A 5"

          # Sound keys mapping
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ];

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
    };

    programs = {
      alacritty = {
        enable = true;
        settings = {
          font.size = 7;
          scrolling.history = 100000;
          window = {
            decorations = "Full";
            startup_mode = "Maximized";
          };
        };
      };
      bash = {
        enable = true;
        enableCompletion = true;
        bashrcExtra = ''
          export PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\[\033[0m\]\$(gitprompt-rs)\$ "
        '';
      };
      git = {
        enable = true;
        extraConfig = {
          init.defaultBranch = "master";
          github.user = githubUsername;
          user = {
            email = email;
            name = fullname;
          };
        };
        ignores = [
          ".idea"
        ];
      };
      waybar = {
        enable = true;
        systemd.enable = true;
        style = ''
          * {
              border:        none;
              border-radius: 0;
              font-family:   "Font Awesome", Roboto, Helvetica, Arial, sans-serif;
              font-size:     15px;
              min-height:    0;
            }

            window#waybar {
              background:    transparent;
              border-bottom: 1px solid rgba(100, 114, 125, 0.5);;
              color:         white;
            }

            tooltip {
              border: 1px solid rgba(100, 114, 125, 0.5);
            }

            tooltip label {
              color: white;
            }
            #cpu, #clock, #battery, #memory, #disk, #disk#home, #temperature, #bluetooth, #backlight, #pulseaudio, #network  {
              padding: 0 10px;
            }
        '';
        settings = [
          {
            height = 32;
            layer = "top";
            position = "top";
            modules-left = [
              "hyprland/workspaces"
            ];
            modules-center = [
              "clock"
            ];
            modules-right = [
              "cpu"
              "memory"
              "disk"
              "disk#home"
              "backlight"
              "pulseaudio"
              "network"
              "bluetooth"
              "temperature"
              "battery"
            ];
            backlight = {
              format = "{icon} {percent}%";
              format-icons = ["󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠"];
            };
            battery = {
              interval = 10;
              format = "{icon} {capacity}%";
              format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
              format-charging = "󰂄 {capacity}%";
              format-plugged = "󱐥 {capacity}% ";
            };
            bluetooth = {
              format = "{status}";
              format-on = "󰂯";
              format-off = "󰂲";
              format-connected = "󰂱";
              tooltip-format = "{num_connections} connected\n\n{controller_alias}\t{controller_address}";
              tooltip-format-connected = "{num_connections} connected:\n\t{device_enumerate}\n\n{controller_alias}\t{controller_address}";
              tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
              on-click = "bluedevil-wizard";
            };
            clock = {
              format = "{:%d-%m-%Y %H:%M}";
              tooltip-format = "<tt><small>{calendar}</small></tt>";
              calendar = {
                mode = "year";
                mode-mon-col = 2;
                weeks-pos = "right";
                on-scroll = 1;
                on-click-right = "mode";
                format = {
                  months = "<span color='#ffead3'><b>{}</b></span>";
                  days = "<span color='#ecc6d9'><b>{}</b></span>";
                  weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                  weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                  today = "<span color='#ff6699'><b><u>{}</u></b></span>";
                };
              };
            };
            cpu = {
              interval = 10;
              format = " {usage}%";
              on-click = "plasma-systemmonitor --page-name Monitoring";
            };
            disk = {
              interval = 10;
              path = "/";
              format = "/ {percentage_used}%";
            };
            "disk#home" = {
              interval = 10;
              path = "/home";
              format = "󰋜 {percentage_used}%";
            };
            memory = {
              format = "󰧑 {percentage}%";
              tooltip-format = "mem: {used:0.1f}G/{total:0.1f}G\nswap: {swapUsed:0.1f}G/{swapTotal:0.1f}G";
            };
            network = {
              interval = 10;
              format-wifi = "{icon}";
              format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
              tooltip-format-wifi = "{essid} ({signalStrength}%)";
            };
            pulseaudio = {
              format = "{icon} {volume}%";
              format-muted = "󰝟";
              format-icons = {
                headphone = "󰋋";
                headset = "󰋎";
                default = ["󰕿" "󰖀" "󰕾"];
              };
              on-click = "pavucontrol";
            };
            temperature = {
              interval = 10;
              critical-threshold = 80;
              format = "󰔏 {temperatureC}°C";
            };
          }
        ];
      };

      # Let Home Manager install and manage itself.
      home-manager.enable = true;
    };
  };
}
