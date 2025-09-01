{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
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
        ./system/ui.nix
        ./system/utils.nix
        ./system/audio.nix
        ./system/zsh.nix
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.liv = ./home.nix;
          home-manager.extraSpecialArgs = {
            uiEnabled = true;
            inherit inputs;
          };
        }
      ];
    };
  };
}
