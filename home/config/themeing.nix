{pkgs}:{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 32;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita";
    };

    cursorTheme = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 32;
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Adwaita";
      package = pkgs.adwaita-qt;
    };
  };
}
