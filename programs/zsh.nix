{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ zsh zoxide fzf ];

  # enable to ensure it works
  programs.zsh.enable = true;
}
