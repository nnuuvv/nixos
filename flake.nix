{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Used with `nixos-rebuild --flake .#<hostname>`
    # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation

    # shitbox config
    nixosConfigurations.shitbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix 
        ./hardware-configuration-shitbox.nix
      ];
    };

    # some other device
    #nixosConfigurations.other-device = nixpkgs.lib.nixosSystem {
    #  system = "x86_64-linux";
    #  modules = [ 
    #    ./configuration.nix 
    #    ./hardware-configuration-other-device.nix
    #  ];
    #};
  };
}
