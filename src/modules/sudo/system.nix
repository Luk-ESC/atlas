{
  config,
  ...
}:
{
  name = "sudo";
  autoEnable = config.security.sudo.enable;
  cfg.persist.location.session.contents = [ "/var/db/sudo/lectured/" ];
}
