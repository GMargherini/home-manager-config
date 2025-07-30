{ pkgs, ... }: {
  programs.ghostty = {
      enable = true;
      settings = {
          theme = "GruvboxDark";
          command = "fish";
          font-family = "FiraCode Nerd Font Mono";
        };
    };
}
