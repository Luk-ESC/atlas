{
  config,
  ...
}:
{
  name = "fprint";
  autoEnable = config.services.fprintd.enable;
  cfg.persist.location.session.contents = [
    "/var/lib/fprint/"
  ];
}
