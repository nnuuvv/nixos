{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Used with `nixos-rebuild --flake .#<hostname>`
    # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation

    # shitbox config
    nixosConfigurations.shitbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # Set all inputs as special args for all submodules
      specialArgs = { inherit inputs; };
      modules = [
        { networking.hostName = "shitbox"; }
        ./hardware/shitbox.nix
        ./configuration.nix

        ./programs/nvim.nix
        ./programs/ui.nix
        ./programs/devtools.nix
        ./programs/utils.nix
        ./programs/zsh.nix
      ];
    };
  };
}
