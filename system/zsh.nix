{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ zsh zoxide fzf ];

  programs.zsh.enable = true;
}
