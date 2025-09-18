{ pkgs, unstable_pkgs, ... }: {
  home.packages = with pkgs; [
    # lsp / compilers
    nixd
    gleam
    erlang
    rebar3
    lua-language-server
    nixfmt-classic
  ];
}
