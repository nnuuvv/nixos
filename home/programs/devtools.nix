{ pkgs, ... }: {
  home.packages = with pkgs; [
    # lsp / compilers
    nixd
    gleam
    lua-language-server
    nixfmt-classic
  ];
}
