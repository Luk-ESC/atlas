{
  description = "Atlas: Simple impermanence modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      impermanence,
      nixpkgs,
      home-manager,
    }:
    {
      nixosModules.default =
        { ... }:
        let
          allModules = import ./src/allModules.nix;
        in
        {
          imports = [
            impermanence.nixosModules.impermanence
          ]
          ++ allModules "system" ./src/persist/persist.nix (x: x.environment.systemPackages);

          home-manager.sharedModules = allModules "hm" ./src/persist/home.nix (x: x.home.packages);

        };
    };
}
