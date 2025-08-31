{ pkgs, inputs, ... }:
{
  # add packages
  environment.systemPackages = with pkgs; [
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    git
    zsh
    zoxide
    fzf
    vivaldi
    xclip
    (python3.withPackages(ps: [ps.pynvim]))

    # lsp / compilers
    nixd
    gcc
    gleam
    lua-language-server

    # utils
    wget
    curl
    ripgrep
    jq

    # archives
    zip
    unzip
    xz
  ];

  # enable to ensure it works
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set default editor to nvim
  environment.variables.EDITOR = "nvim";
}
