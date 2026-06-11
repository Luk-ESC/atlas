name: allPkgs: locs: basePath:
let
  mkMod = import ./mkMod.nix;
  moduleDirs = builtins.attrNames (builtins.readDir ./modules);
  modulePaths = builtins.filter builtins.pathExists (map (x: ./modules/${x}/${name}.nix) moduleDirs);
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
  ./persist/${name}.nix
]
++ map wrap modulePaths
