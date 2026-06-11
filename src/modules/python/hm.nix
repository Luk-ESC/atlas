{ realPath, pkgExists, ... }:
let
  histPath = realPath "data" ".python_history";
in
{
  name = "python";
  autoEnable = pkgExists "python3";
  cfg.home.sessionVariables.PYTHON_HISTORY = histPath;
  cfg.atlas.extraPaths = [ histPath ];
}
