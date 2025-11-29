{
  description = "sadnix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      mkHost =
        {
          hostname,
          profile,
          username,
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            host = hostname;
            inherit profile;
            inherit username;
            zen-browser = inputs.zen-browser.packages.${system}.default;
          };
          modules = [
            ./profiles/${profile}
          ];
        };
    in
    {
      nixosConfigurations = {
        worki = mkHost {
          hostname = "worki";
          profile = "amd";
          username = "sada";
        };
      };
    };
}
