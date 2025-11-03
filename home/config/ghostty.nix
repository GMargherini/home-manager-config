{ pkgs, ... }: {

  programs.ghostty = {
      enable = true;
      settings = {
          theme = "iTerm2 Default";
          command = "fish";
          font-family = "FiraCode Nerd Font Mono";
	  background-opacity = 1;
        };
    };
}
