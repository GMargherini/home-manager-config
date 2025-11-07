{ pkgs, ... }: {

  programs.ghostty = {
      enable = true;
      settings = {
          theme = "Dracula";
          command = "fish";
          font-family = "FiraCode Nerd Font Mono";
	  background-opacity = 1;
        };
    };
}
