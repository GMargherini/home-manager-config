{
  description = "Home Manager configuration of dolphin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, anyrun, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."dolphin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      anyrun = {
        enable = true;
        config = {
          x = { fraction = 0.5; };
          y = { fraction = 0.3; };
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
    };
}
