{ pkgs,
}:
let
  anyrun = pkgs.anyrun;
in
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

          plugins = with anyrun; [
            # An array of all the plugins you want, which either can be paths to the .so files, or their packages
            "${anyrun}/lib/libapplications.so"
            "${anyrun}/lib/libsymbols.so"
            "${anyrun}/lib/libshell.so"
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
      };
  }
