{ pkgExists, ... }:
rec {
  name = "geogebra";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".config/GeoGebra/" ];
}
