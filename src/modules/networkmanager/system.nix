{
  config,
  ...
}:
{
  name = "networkmanager";
  autoEnable = config.networking.networkmanager.enable;
  cfg.persist.location.session.contents = [
    "/etc/NetworkManager/system-connections/"
  ];
}
