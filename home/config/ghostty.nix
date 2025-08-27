{ pkgs, ... }: {

  programs.ghostty = {
      enable = true;
      settings = {
          theme = "Galaxy";
          command = "fish";
          font-family = "FiraCode Nerd Font Mono";
	  background-opacity = 1;
        };
    };
}
