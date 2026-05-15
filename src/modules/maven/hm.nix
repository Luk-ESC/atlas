{ pkgExists, ... }:
rec {
  name = "maven";
  autoEnable = pkgExists name;
  cfg.persist.caches.contents = [ ".m2/" ];
}
