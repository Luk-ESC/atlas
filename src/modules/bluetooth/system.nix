{
  config,
  ...
}:
{
  name = "bluetooth";
  autoEnable = config.hardware.bluetooth.enable;
  cfg.persist.location.session.contents = [
    {
      directory = "/var/lib/bluetooth/";
      mode = "0700";
    }
  ];
}
