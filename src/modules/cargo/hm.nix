{ config, realPath, ... }:
let
  cargoHome = realPath "caches" ".cargo";
in
{
  name = "cargo";
  autoEnable = config.programs.cargo.enable;
  cfg.home.sessionVariables.CARGO_HOME = cargoHome;
  cfg.atlas.extraPaths = [ cargoHome ];
}
