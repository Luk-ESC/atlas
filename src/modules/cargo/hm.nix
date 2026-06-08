{ config, ... }:
let
  # TODO: realPath?
  cargoHome = config.persist.data.prefix + "caches" + config.home.homeDirectory + "/.cargo";
in
{
  name = "cargo";
  autoEnable = config.programs.cargo.enable;
  cfg.home.sessionVariables.CARGO_HOME = cargoHome;
  cfg.atlas.extraPaths = [ cargoHome ];
}
