{ pkgExists, ... }:
{
  name = "wine";
  autoEnable = builtins.any pkgExists [
    "wine"
    "wine-wow"
  ];
  cfg.persist.session.contents = [ ".wine/" ];
}
