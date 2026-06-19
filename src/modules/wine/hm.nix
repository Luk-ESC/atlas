{ realPath, pkgExists, ... }:
let
  prefix = realPath "session" ".wine";
in
{
  name = "wine";
  autoEnable = builtins.any pkgExists [
    "wine"
    "wine-wow"
    "wine64"
    "wine-wow64"
  ];
  cfg.home.sessionVariables.WINEPREFIX = prefix;
  cfg.atlas.extraPaths = [ prefix ];
}
