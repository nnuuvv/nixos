{ pkgs, inputs, ... }:
{
  # add packages
  environment.systemPackages = with pkgs; [
    git
    zsh
    zoxide
    fzf
    vivaldi
    xclip
    python313.withPackages(ps: [ps.pynvim])

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

  # nvim nightly
  programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  # enable to ensure it works
  programs.zsh.enable = true;

  # Install vivaldi.
  programs.vivaldi.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set default editor to nvim
  environment.variables.EDITOR = "nvim";
}
