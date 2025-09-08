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
            color: white;
            background: rgba(128,128,128,0.1);
            border: 2px solid SeaGreen;
            }

            row:selected {
            background: SeaGreen;
            color: black;
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
