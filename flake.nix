{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    # Used with `nixos-rebuild --flake .#<hostname>`
    # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation

    # shitbox config
    nixosConfigurations.shitbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # Set all inputs as special args for all submodules
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix 
        ./hardware-configuration-shitbox.nix
      ];
    };

    # some other device
    #nixosConfigurations.other-device = nixpkgs.lib.nixosSystem {
    #  system = "x86_64-linux";
       # Set all inputs as special args for all submodules
    #  specialArgs = { inherit inputs; };
    #  modules = [ 
    #    ./configuration.nix 
    #    ./hardware-configuration-other-device.nix
    #  ];
    #};
  };
}
