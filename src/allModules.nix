name: additional:
let
  mkMod = import ./mkMod.nix;
  moduleDirs = builtins.attrNames (builtins.readDir ./modules);
  modulePaths = builtins.concatMap (
    dir:
    let
      pth = ./modules + "/${dir}/${name}.nix";
    in
    if builtins.pathExists pth then [ pth ] else [ ]
  ) moduleDirs;
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
[ additional ] ++ builtins.map wrap modulePaths
