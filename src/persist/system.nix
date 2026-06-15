{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.persist;
  loc = cfg.location;
  base = pkgs.callPackage ./base.nix { };
in
{
  options.persist = with lib.types; {
    users = lib.mkOption {
      description = "users to persist";
      default = [ ];
      type = listOf str;
    };

    location = base.persistentOption;
  };

  config =
    let
      fileSystems = lib.concatMapAttrs (name: v: {
        ${v.prefix + name}.neededForBoot = true;
      }) loc;
    in
    {
      inherit fileSystems;
      virtualisation.vmVariantWithDisko.virtualisation.fileSystems = fileSystems;

      environment.persistence = lib.concatMapAttrs (name: v: {
        ${v.prefix + name} = base.dirsAndFiles true v.contents // {
          hideMounts = true;

          users = lib.genAttrs cfg.users (_: base.dirsAndFiles false v.contents);
        };
      }) loc;
    };
}
