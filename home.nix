{ lib, home-manager, specialArgs, ... }: {
  programs.home-manager.enable = true;

  home.username = "liv";
  home.homeDirectory = lib.mkForce "/home/liv";

  home.stateVersion = "25.05";

  imports = map (x: ./home + x) [
    /packages.nix

    /programs/nvim.nix
    /programs/devtools.nix
  ] ++ (if specialArgs.uiEnabled then
    (map (x: ./home + x) [
      /programs/wezterm.nix
      /programs/steam.nix
      /programs/vesktop.nix
      /programs/vivaldi.nix
    ])
  else
    [ ]);

}

