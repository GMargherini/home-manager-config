{
  services.swaync = {
      enable = true;
      settings = {
          {
            "$schema": "/etc/xdg/swaync/configSchema.json",
            "positionX": "right",
            "positionY": "top",
            "layer": "overlay",
            "control-center-layer": "top",
            "layer-shell": true,
            "cssPriority": "application",
              "control-center-margin-top": 5,
              "control-center-margin-bottom": 0,
              "control-center-margin-right": 0,
              "control-center-margin-left": 0,
              "notification-2fa-action": true,
              "notification-inline-replies": false,
              "notification-icon-size": 24,
              "notification-body-image-height": 100,
              "notification-body-image-width": 200,
              "timeout": 6,
              "timeout-low": 3,
              "timeout-critical": 0,
              "fit-to-screen": false,
              "control-center-width": 350,
              "control-center-height": 720,
              "notification-window-width": 400,
              "keyboard-shortcuts": true,
              "image-visibility": "when available",
              "transition-time": 200,
              "hide-on-clear": false,
              "hide-on-action": true,
              "script-fail-notify": true,
              "widgets": [
                  "buttons-grid",
                  "title",
                  "notifications"
              ],
              "widget-config": {
                  "title": {
                      "text": "Notifications",
                      "clear-all-button": true,
                      "button-text": "Clear"
                  },
                  "dnd": {
                      "text": "Do Not Disturb"
                  },
                  "label": {
                      "max-lines": 1,
                      "text": "Notification"
                  },
                  "mpris": {
                      "image-size": 10,
                      "image-radius": 0
                  },
                  "volume": {
                      "label": "󰕾"
                  },
                  "backlight": {
                      "label": "󰃟"
                  },
                  "buttons-grid": {
                      "actions": [
                          {
                              "label": "󰐥",
                              "command": "systemctl poweroff"
                          },
                          {
                              "label": "󰜉",
                              "command": "systemctl reboot"
                          },
                          {
                              "label": "󰌾",
                              "command": "~/.config/hypr/scripts/LockScreen.sh"
                          },                {
                              "label": "󰂯",
                              "command": "blueman-manager"
                          }
                      ]
                  }
              }
          }
        };

        style = '' 
          .notification-row {
            outline: none; }

.notification-row:focus, .notification-row:hover {
  background: rgba(68, 68, 68, 0.6); }

.notification-row .notification-background {
  padding: 6px 12px; }
  .notification-row .notification-background .close-button {
    background: rgba(255, 255, 255, 0.1);
    color: white;
    text-shadow: none;
    padding: 0;
    border-radius: 100%;
    margin-top: 5px;
    margin-right: 5px;
    box-shadow: none;
    border: none;
    min-width: 24px;
    min-height: 24px; }
    .notification-row .notification-background .close-button:hover {
      box-shadow: none;
      background: rgba(255, 255, 255, 0.15);
      transition: background 0.15s ease-in-out;
      border: none; }
  .notification-row .notification-background .notification {
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, 0.15);
    padding: 0;
    transition: background 0.15s ease-in-out;
    background: rgba(0, 0, 0, 0.2); }
    .notification-row .notification-background .notification .notification-default-action {
      border-radius: 12px; }
      .notification-row .notification-background .notification .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px; }
      .notification-row .notification-background .notification .notification-default-action .notification-content {
        background: transparent;
        border-radius: 12px;
        padding: 4px; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .image {
          -gtk-icon-effect: none;
          border-radius: 100px;
          margin: 4px; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .app-icon {
          -gtk-icon-effect: none;
          -gtk-icon-shadow: 0 1px 4px black;
          margin: 6px; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .summary {
          font-size: 16px;
          font-weight: bold;
          background: transparent;
          color: white;
          text-shadow: none; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .time {
          font-size: 16px;
          font-weight: bold;
          background: transparent;
          color: white;
          text-shadow: none;
          margin-right: 30px; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .body {
          font-size: 15px;
          font-weight: normal;
          background: transparent;
          color: white;
          text-shadow: none; }
        .notification-row .notification-background .notification .notification-default-action .notification-content progressbar {
          margin-top: 4px; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .body-image {
          margin-top: 4px;
          background-color: white;
          border-radius: 12px;
          -gtk-icon-effect: none; }
        .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply {
          margin-top: 4px; }
          .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-entry {
            background: #262626;
            color: white;
            caret-color: white;
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px; }
          .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button {
            margin-left: 4px;
            background: rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            color: white; }
            .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:disabled {
              background: initial;
              color: #969696;
              border: 1px solid rgba(255, 255, 255, 0.15);
              border-color: transparent; }
            .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:hover {
              background: #383838; }
    .notification-row .notification-background .notification .notification-action {
      border-top: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: 0px;
      border-right: 1px solid rgba(255, 255, 255, 0.15); }
      .notification-row .notification-background .notification .notification-action:first-child {
        border-bottom-left-radius: 12px; }
      .notification-row .notification-background .notification .notification-action:last-child {
        border-bottom-right-radius: 12px;
        border-right: none; }

.notification-row .notification-background .notification .notification-action, .notification-row .notification-background .notification .notification-default-action {
  padding: 4px;
  margin: 0;
  box-shadow: none;
  background: transparent;
  border: none;
  color: white;
  transition: background 0.15s ease-in-out; }

.notification-row .notification-background .notification .notification-action:hover, .notification-row .notification-background .notification .notification-default-action:hover {
  -gtk-icon-effect: none;
  background: #383838; }

.notification-group .notification-group-headers .notification-group-icon {
  color: white; }

.notification-group .notification-group-headers .notification-group-header {
  color: white; }

.notification-group.collapsed .notification-row .notification {
  background-color: black; }

.notification-group.collapsed:hover .notification-row:not(:only-child) .notification {
  background-color: #383838; }

.notification-group .notification-group-buttons, .notification-group .notification-group-headers {
  margin: 0 16px;
  color: white; }

.notification-group.collapsed .notification-row:not(:last-child) .notification-action,
.notification-group.collapsed .notification-row:not(:last-child) .notification-default-action {
  opacity: 0; }

.control-center {
  background: #282828;
  color: white;
  border-radius: 8px;
  border: 2px solid #d5c4a1; }
  .control-center .control-center-list-placeholder {
    opacity: 0.5; }
  .control-center .control-center-list {
    background: transparent; }
    .control-center .control-center-list .notification {
      box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7), 0 2px 6px 2px rgba(0, 0, 0, 0.3); }

.control-center .control-center-list .notification .notification-default-action,
.control-center .control-center-list .notification .notification-action {
  transition: opacity 400ms ease-in-out, background 0.15s ease-in-out; }

.control-center .control-center-list .notification .notification-default-action:hover,
.control-center .control-center-list .notification .notification-action:hover {
  background-color: #383838; }

.blank-window {
  background: transparent; }

.floating-notifications {
  background: transparent; }
  .floating-notifications .notification {
    box-shadow: none; }

.widget-title {
  color: white;
  margin: 8px;
  font-size: 1.5rem; }
  .widget-title > button {
    font-size: initial;
    color: white;
    text-shadow: none;
    background: rgba(0, 0, 0, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: none;
    border-radius: 12px; }
    .widget-title > button:hover {
      background: #383838; }

.widget-dnd {
  color: white;
  margin: 8px;
  font-size: 1.1rem; }
  .widget-dnd > switch {
    font-size: initial;
    border-radius: 12px;
    background: rgba(0, 0, 0, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: none; }
    .widget-dnd > switch:checked {
      background: #d5c4a1; }
    .widget-dnd > switch slider {
      background: #383838;
      border-radius: 12px; }

.widget-label {
  margin: 8px; }
  .widget-label > label {
    font-size: 1.1rem; }

.widget-mpris .widget-mpris-player {
  padding: 8px;
  padding: 16px;
  margin: 16px 20px;
  background-color: rgba(0, 0, 0, 0.55);
  border-radius: 12px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75); }
  .widget-mpris .widget-mpris-player button:hover {
    background: #383838; }
  .widget-mpris .widget-mpris-player .widget-mpris-album-art {
    border-radius: 12px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75); }
  .widget-mpris .widget-mpris-player .widget-mpris-title {
    font-weight: bold;
    font-size: 1.25rem; }
  .widget-mpris .widget-mpris-player .widget-mpris-subtitle {
    font-size: 1.1rem; }
  .widget-mpris .widget-mpris-player > box > button {
    color: white; }
    .widget-mpris .widget-mpris-player > box > button:hover {
      background-color: rgba(0, 0, 0, 0.5); }

.widget-buttons-grid {
  padding: 8px;
  margin: 8px;
  border-radius: 8px;
  background-color: rgba(0, 0, 0, 0.2); }
  .widget-buttons-grid > flowbox > flowboxchild > button {
    background: rgba(0, 0, 0, 0.2);
    color: white;
    border-radius: 8px;
    border: 2px solid #d5c4a1; }

.widget-menubar > box > .menu-button-bar > button {
  border: none;
  background: transparent; }

.topbar-buttons > button {
  border: none;
  background: transparent; }

.widget-volume {
  background-color: rgba(0, 0, 0, 0.2);
  padding: 8px;
  margin: 8px;
  border-radius: 12px;
  border: 2px solid #d5c4a1; }
  .widget-volume > box > button {
    background: transparent;
    border: none; }

.per-app-volume {
  background-color: rgba(0, 0, 0, 0.2);
  padding: 4px 8px 8px 8px;
  margin: 0px 8px 8px 8px;
  border-radius: 12px; }

.widget-backlight {
  background-color: rgba(0, 0, 0, 0.2);
  padding: 8px;
  margin: 8px;
  border-radius: 12px; }

.widget-inhibitors {
  margin: 8px;
  font-size: 1.5rem; }
  .widget-inhibitors > button {
    font-size: initial;
    color: white;
    text-shadow: none;
    background: rgba(0, 0, 0, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: none;
    border-radius: 12px; }
    .widget-inhibitors > button:hover {
      background: #383838; }
        '';
    }
}
