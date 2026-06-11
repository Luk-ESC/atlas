{
  lib,
  config,
  realPath,
  ...
}:
let
  p = realPath "session" ".config/codex";
in
{
  name = "codex";
  autoEnable = config.programs.codex.enable;
  cfg.home.sessionVariables.CODEX_HOME = lib.mkForce p;
  cfg.atlas.extraPaths = [ p ];
}
