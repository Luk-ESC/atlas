{ pkgExists, ... }:
rec {
  name = "openjdk";
  autoEnable = pkgExists name;
  cfg.persist.caches.contents = [ ".java/fonts/" ];
}
