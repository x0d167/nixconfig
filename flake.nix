{
  description = "Multi-host NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      mkHost = { hostname, username, system ? "x86_64-linux" }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username hostname; };
          modules = [
            ./hosts/${hostname}
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	      home-manager.backupFileExtension = "hm-bak";
              home-manager.users.${username} = import ./home/home.nix;
              home-manager.extraSpecialArgs = { inherit username; };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        zenbook = mkHost { hostname = "zenbook"; username = "grip"; };
      };
    };
}
