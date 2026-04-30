{ pkgExists, ... }:
rec {
  name = "bun";
  autoEnable = pkgExists name;
  cfg.persist.caches.contents = [ ".bun/install/cache/" ];
}
