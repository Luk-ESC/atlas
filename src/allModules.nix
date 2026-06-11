name: additional: allPkgs: locs: basePath:
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
  pkgExists = cfg: name: builtins.any (p: p ? pname && p.pname == name) (allPkgs cfg);
  realPath =
    cfg: loc: p:
    (locs cfg).${loc}.prefix + loc + (basePath cfg) + p;
  wrap =
    path:
    args@{
      config,
      lib,
      pkgs,
      ...
    }:
    (mkMod args) (
      import path (
        args
        // {
          pkgExists = pkgExists config;
          realPath = realPath config;
        }
      )
    );

in
[
  ./extraPaths.nix
  additional
]
++ builtins.map wrap modulePaths
