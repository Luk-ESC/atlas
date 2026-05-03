{ config, pkgExists, ... }:
let
  # TODO: realPath?
  goPath = config.persist.caches.prefix + "caches" + config.home.homeDirectory + "/go/";
in
rec {
  name = "go";
  autoEnable = pkgExists name;
  cfg.home.sessionVariables.GOPATH = goPath;
  cfg.atlas.extraPaths = [ goPath ];
}
