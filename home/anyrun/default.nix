{
     programs.anyrun = {
        enable = true;
        config = {
          x = { fraction = 0.5; };
          y = { fraction = 0.5; };
          width = { fraction = 0.3; };
          hideIcons = false;
          ignoreExclusiveZones = false;
          layer = "overlay";
          hidePluginInfo = false;
          closeOnClick = false;
          showResultsImmediately = false;
          maxEntries = null;

          plugins = [
            # An array of all the plugins you want, which either can be paths to the .so files, or their packages
            "libapplications.so"
            "libsymbols.so"
            "libshell.so"
            "libkidex.so"
            "libwebsearch.so"
          ];
        };
        extraCss = /*css */ ''
          window {
            background: none;
            }

            list, entry {
            color: #d5c4a1;
            background: #282828;
            border: 2px solid #d5c4a1;
            border-radius: 8px;
            }

            row:selected {
            background: #d5c4a1;
            border-radius: 8px;
            color: #282828;
          }
        '';
        extraConfigFiles."websearch.ron".text = ''
          Config(
            // for any other plugin
            // this file will be put in ~/.config/anyrun/some-plugin.ron
            // refer to docs of xdg.configFile for available options
            prefix: ":?",
            engines: [Ecosia]
          )
        '';
      };
  }
