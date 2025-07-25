{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [
          "custom/menu"
          "hyprland/workspaces"
          "hyprland/submap"
        ];

        modules-center = [
          "clock"
          "custom/weather"
        ];

        modules-right = [
          "keyboard-state"
          "mpris"
          "network"
          "temperature"
          "cpu"
          "memory"
          "wireplumber"
          "backlight"
          "battery"
          "tray"
          "custom/notification"
        ];

        "hyprland/workspaces"= {
          disable-scroll= true;
          all-outputs= true;
          warp-on-scroll= false;
          show-special= true;
          special-visible-only= true;
          format= "{name}";
          format-icons= {
            urgent= "";
            active= "";
            default= "";
          };
          format-window-separator = ":";
        };
        "hyprland/submap" = {
          "format"= "{}";
          "max-length" = 8;
          "tooltip" = false;
        };
        "keyboard-state" = {
          "numlock" = true;
          "format" = "{icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "mpris" = {
          "format" = "{player_icon}";
          "format-paused" = "{status_icon}";
          "dynamic-len" = 20;
          "ellipsis" = "...";
          "dynamic-order" = ["title" "artist" "album"];
          "tooltip-format" = "{dynamic}";
          "player-icons" = {
            "default" = "▶";
            "mpv" = "🎵";
          };
          "status-icons" = {
            "paused" = "⏸";
          };
          "ignored-players" = [];
        };
        "tray" = {
          "spacing" = 10;
        };
        "clock" = {
          tooltip-format = "<big>{calendar}</big>";
          format = "{:%d/%m/%Y %H:%M}";
          on-scroll = 1;
        };
        "cpu" = {
          "format" = "{icon} {usage}%";
          "tooltip" = true;
          "format-icons" = [" " "▁"  "▂"  "▃"  "▄"  "▅"  "▆"  "▇"  "█"];
        };
        "memory" = {
          "format" = " {}%";
        };
        "temperature" = {
          "thermal-zone" = 2;
          "hwmon-path" = ["/sys/class/hwmon/hwmon2/temp1_input"  "/sys/class/thermal/thermal_zone0/temp"];
          "critical-threshold" = 80;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [""  "" ""  ""];
        };
        "backlight" = {
          "format" = "{icon}";
          "format-icons" = ["" "" "" "" "" "" "" ""];
          "tooltip" = true;
          "tooltip-format" = "{}%";
        };
        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          "format-good" = "";
          "format-full" = "";
          "format-icons" = ["" "" "" "" ""];
        };
        "battery#bat2" = {
          "bat" = "BAT2";
        };
        "network" = {
          "format-wifi" = "  {signalStrength}% (↓ {bandwidthDownBits}, ↑ {bandwidthUpBits})";
          "format-ethernet" = " (↓ {bandwidthDownBits}; ↑ {bandwidthUpBits})";
          "tooltip-format" = "{essid} = {ipaddr}";
          "format-linked" = " {ifname} (No IP)";
          "format-disconnected" = "Disconnected ⚠ {ifname}";
          "interval" = 10;
          "on-click" = "kitty -- nmtui";
        };
        "wireplumber" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = " {icon} {volume}%";
          "format-bluetooth-muted" = "🚫  {icon}";
          "format-muted" = "{icon} 🚫";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "on-click" = "GSK_RENDERER=ngl pwvucontrol";
        };
        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
        "custom/menu" = {
          "format" = "";
          "on-click" = "anyrun";
          "tooltip-format" = "Launcher";
        };
        "custom/weather" = {
          format = "{text}";
          exec = "curl wttr.in/Cunardo?format=1";
          tooltip = false;
          interval = 300;
        };
        "custom/fuzzy_clock" = {
          "format" = "{text}";
          "exec" = "fuzzy_clock";
          "tooltip" = false;
        };
      };
    };
    style = ''
      * {
        font-family: "FiraCode Medium";
        font-size: 16px;
        min-height: 20px;
        background-color: transparent;
        border-radius: 8px; }

      window#waybar {
        color: #fbf1c7;
        background-color: transparent; }

#workspaces button {
        background: #282828;
        color: #fbf1c7;
        margin: 0 2px;
        border-radius: 8px;
        padding: 2px 0px; }
        #workspaces button:hover, #workspaces button.focused {
          color: #282828;
          background: #d5c4a1; }
        #workspaces button.urgent {
          background: red;
          color: white;
          border: 1px solid white; }

      tooltip {
        background-color: transparent;
        border: none; }

      tooltip label,
#tray window decoration {
        background-color: #282828;
        padding: 4px;
        border: 2px solid #d5c4a1;
        border-radius: 8px;
        color: #fbf1c7; }

#tray window label:hover {
        color: gray; }

#clock {
        background: #282828;
        border-right: 2px solid #d5c4a1;
        border-radius: 8px 0 0 8px;
        padding: 0 6px; }

#custom-weather {
        background: #282828;
        border-radius: 0 8px 8px 0;
        padding: 0 6px; }

#custom-notification {
        background-color: #282828;
        margin: 0;
        padding: 0 6px;
        border-radius: 0 8px 8px 0; }

      .modules-left {
        background-color: #282828;
        margin: 2px;
        padding: 0 0px;
        border-radius: 8px;
        border: 2px solid #d5c4a1; }

      .modules-center {
        background-color: #282828;
        margin: 2px;
        padding: 0px;
        border-radius: 8px;
        border: 2px solid #d5c4a1; }

      .modules-right {
        background-color: #282828;
        margin: 2px;
        padding: 0;
        border-radius: 8px;
        border: 2px solid #d5c4a1; }

#keyboard-state {
        background-color: #282828;
        border-right: 2px solid #d5c4a1;
        padding: 0 6px;
        border-radius: 8px 0 0 8px; }
        #keyboard-state.disconnected {
          color: red; }

#cpu,
#temperature,
#memory,
#wireplumber,
#backlight,
#battery,
#tray,
#network,
#mpris {
        border-right: 2px solid #d5c4a1;
        padding: 0 6px;
        background-color: #282828;
        border-radius: 0px; }

#network:hover,
#wireplumber:hover,
#battery:hover,
#custom-notification:hover {
        background-color: #d5c4a1;
        color: #282828; }

#custom-menu {
        color: #fbf1c7;
        background-color: #282828;
        padding: 4px 8px;
        margin: 0px;
        border-radius: 8px; }
        #custom-menu:hover {
          background-color: #d5c4a1;
          color: #282828; }

#custom-separator {
        color: #d5c4a1; }

#battery icon {
        color: red; }

#battery.critical:not(.charging) {
        color: red;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate; }

#battery.charging,
#battery.plugged {
        color: lime; }

#battery.warning:not(.charging) {
        color: yellow;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate; }

      label:focus {
        background-color: black; }

#temperature.critical {
        color: #eb4d4b; }

#idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436; }

#tray > .passive {
        -gtk-icon-effect: dim; }

#tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b; }

#tray * {
        padding-left: 0px;
        padding-right: 0px; }
    '';
  };
}
