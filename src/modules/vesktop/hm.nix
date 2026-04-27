{
  config,
  ...
}:
{
  name = "vesktop";
  autoEnable = config.programs.vesktop.enable;
  cfg.persist.session.contents = [ ".config/vesktop/" ];
}
