{ pkgExists, ... }:
{
  name = "wine";
  autoEnable = builtins.any pkgExists [
    "wine"
    "wine-wow"
    "wine64"
    "wine-wow64"
  ];
  cfg.persist.session.contents = [ ".wine/" ];
}
