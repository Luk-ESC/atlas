{ config, pkgExists, ... }:
let
  # TODO: realPath?
  histPath = config.persist.data.prefix + "data" + config.home.homeDirectory + "/.python_history";
in
{
  name = "python";
  autoEnable = pkgExists "python3";
  cfg.home.sessionVariables.PYTHON_HISTORY = histPath;
  cfg.atlas.extraPaths = [ histPath ];
}
