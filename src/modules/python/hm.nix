{ config, ... }:
let
  # TODO: extraPaths?
  histPath = config.persist.data.prefix + "data" + config.home.homeDirectory + "/.python_history";
in
{
  name = "python";
  cfg.home.sessionVariables.PYTHON_HISTORY = histPath;
}
