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
    { impermanence, ... }:
    {
      nixosModules.default =
        { ... }:
        let
          allModules = import ./src/allModules.nix;

          sysMods = allModules "system" (x: x.environment.systemPackages) (x: x.persist.locations) (_: "/");
          hmMods = allModules "hm" (x: x.home.packages) (x: x.persist) (x: x.home.homeDirectory + "/");
        in
        {
          imports = [ impermanence.nixosModules.impermanence ] ++ sysMods;

          home-manager.sharedModules = hmMods;

        };
    };
}
