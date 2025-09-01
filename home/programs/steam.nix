{ pkgs, ... }: {
  home.packages = [ pkgs.steam ];
  # programs.steam = { enable = true; };
}
