{pkgs, ...}: {
  programs.lutris = {
    enable = true;
    winePackages = [pkgs.wine];
    runners = {
    };
  };
}
