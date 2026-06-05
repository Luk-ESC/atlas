{ lib, config, ... }:
let
  # TODO: realPath?
  p = config.persist.session.prefix + "session" + config.xdg.configHome + "/codex";
in
{
  name = "codex";
  autoEnable = config.programs.codex.enable;
  cfg.home.sessionVariables.CODEX_HOME = lib.mkForce p;
  cfg.atlas.extraPaths = [ p ];
}
