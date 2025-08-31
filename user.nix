{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liv = {
    isNormalUser = true;
    description = "liv";
    extraGroups = [ "networkmanager" "wheel" "root" ];
    shell = pkgs.zsh;
  };
}
