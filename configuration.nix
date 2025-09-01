{ inputs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";

  # Enable flakes and new CLI
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [ ./locale.nix ./user.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
