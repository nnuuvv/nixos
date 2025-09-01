{ pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  # nvim dependencies 
  # clipboard provider
  # python3 provider for codestats plugin
  home.packages = with pkgs; [
    gcc
    xclip
    (python3.withPackages (ps: [ ps.pynvim ]))
  ];
}
