{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dolphin";
  home.homeDirectory = "/home/dolphin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  services.kdeconnect.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    adwaita-icon-theme
    anyrun
    bat
    calc
    cbonsai
    cowsay
    devtoolbox
    discord
    fastfetch
    fish
    ghostty
    htop
    hyprcursor
    hyprland
    hyprpaper
    inkscape
    kdePackages.isoimagewriter
    kdePackages.kdeconnect-kde
    kdePackages.ktorrent
    kdePackages.partitionmanager
    libreoffice
    lua-language-server
    mpv
    newsboat
    neovim
    nvtopPackages.amd
    obsidian
    onlyoffice-desktopeditors
    pika-backup
    remmina
    retroarch
    ripgrep
    ripgrep-all
    ryubing
    scrcpy
    starship
    stylua
    swaynotificationcenter
    tdf
    vimPlugins.LazyVim
    vlc
    vscodium
    waybar
    wineWowPackages.staging
    yazi
    zellij

    fira
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-emoji
    proggyfonts

  ];
  
  fonts.fontconfig.enable = true;
  programs.git = {
    enable = true;
    userName  = "GMargherini";
    userEmail = "giorgio.margherini@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dolphin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
    imports = [
    ./anyrun/default.nix
    ./waybar/default.nix
    ./swaync/default.nix
    ./config/yt-dlp.nix
    ./kitty/default.nix
    ./hypr/hyprland.nix
    ./hypr/hyprpaper.nix
    ./hypr/hyprlock.nix
    ./config/ghostty.nix
    ./config/lutris.nix
    ./config/fish.nix
  ];
  programs = {
    yazi.enable = true;
    zellij.enable = true;
    ripgrep.enable = true;
    mpv.enable = true;
    home-manager.enable = true;
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 32;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "Gruvbox-Dark";
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
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox";
      "x-scheme-handler/http" = "firefox";
      "x-scheme-handler/https" = "firefox";
      "inode/directory" = "dolphin";
    };
  };
}
