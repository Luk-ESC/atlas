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
    ./persist/persist.nix
  ]
  ++ builtins.map wrap [
    ./modules/waydroid/system.nix
    ./modules/bluetooth/system.nix
    ./modules/chrony/system.nix
  ];
}
