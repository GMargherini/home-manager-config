{ pkgs, ... }: {

  programs.ghostty = {
      enable = true;
      settings = {
          theme = "Dracula";
          command = "nu";
          font-family = "FiraCode Nerd Font Mono";
	  background-opacity = 1;
        };
    };
}
