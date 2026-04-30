{
  config,
  ...
}:
{
  name = "waydroid";
  autoEnable = config.virtualisation.waydroid.enable;
  cfg.persist.location = {
    session.contents = [
      "/var/lib/waydroid/"
      ".local/share/waydroid/"
    ];
    logs.contents = [ "/var/lib/waydroid/waydroid.log" ];
  };
}
