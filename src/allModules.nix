name: additional: allPkgs:
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
  pkgExists = cfg: name: builtins.any (p: if p ? pname then p.pname == name else false) (allPkgs cfg);
  wrap =
    path:
    args@{
      config,
      lib,
      pkgs,
      ...
    }:
    (mkMod args) (import path (args // { pkgExists = pkgExists config; }));

in
[ additional ] ++ builtins.map wrap modulePaths
