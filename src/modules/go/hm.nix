{ pkgExists, realPath, ... }:
let
  goPath = realPath "caches" "go/";
in
rec {
  name = "go";
  autoEnable = pkgExists name;
  cfg.home.sessionVariables.GOPATH = goPath;
  cfg.atlas.extraPaths = [ goPath ];
}
