{
  config,
  ...
}:
{
  name = "bluetooth";
  autoEnable = config.hardware.bluetooth.enable;
  cfg.persist.location.session.contents = [ "/var/lib/bluetooth/" ];
}
