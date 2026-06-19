{ config, realPath, ... }:
let
  goPath = realPath "caches" "go/";
in
{
  name = "go";
  autoEnable = config.programs.go.enable;
  cfg.programs.go.env.GOPATH = goPath;
  cfg.atlas.extraPaths = [ goPath ];
}
