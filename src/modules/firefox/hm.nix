{
  config,
  ...
}:
{
  name = "firefox";
  autoEnable = config.programs.firefox.enable;
  cfg.persist.session.contents = [ ".mozilla/" ];
}
