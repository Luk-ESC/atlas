{ ... }:
let
  mkMod = import ./mkMod.nix;
  wrap =
    path:
    args@{
      config,
      lib,
      pkgs,
      ...
    }:
    (mkMod args) (import path args);
in
{
  imports = [
    ./persist/home.nix
  ]
  ++ builtins.map wrap [
    ./modules/firefox/hm.nix
    ./modules/podman/hm.nix
    ./modules/maltego/hm.nix
    ./modules/vesktop/hm.nix
    ./modules/codex/hm.nix
    ./modules/steam/hm.nix
    ./modules/cargo/hm.nix
  ];
}
