{ pkgExists, ... }:
rec {
  name = "gimp";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".config/GIMP/" ];
}
