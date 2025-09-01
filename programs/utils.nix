{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
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
}
