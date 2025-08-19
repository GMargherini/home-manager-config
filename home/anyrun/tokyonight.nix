{
     programs.anyrun = {
        enable = true;
        config = {
          x = { fraction = 0.5; };
          y = { fraction = 0.4; };
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
            color: #9AA5CE;
            background: #1a1b26;
            border: 2px solid #7aa2f7;
            border-radius: 8px;
            }

            row:selected {
            background: #7aa2f7;
            border-radius: 8px;
            color: #1a1b26;
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
