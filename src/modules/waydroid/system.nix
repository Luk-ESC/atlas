{
  config,
  ...
}:
{
  name = "waydroid";
  autoEnable = config.virtualisation.waydroid.enable;
  cfg.persist.location = {
    session.contents = [ "/var/lib/waydroid/" ];
    logs.contents = [ "/var/lib/waydroid/waydroid.log" ];
  };
}
