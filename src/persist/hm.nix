{
  lib,
  config,
  pkgs,
  ...
}:
let
  loc = config.persist;
  base = pkgs.callPackage ./base.nix { };
in
{
  options.persist = base.persistentOption;

  config.home.persistence = lib.concatMapAttrs (name: v: {
    ${v.prefix + name} = base.dirsAndFiles false v.contents;
  }) loc;
}
