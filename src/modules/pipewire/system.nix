{
  config,
  ...
}:
{
  name = "pipewire";
  autoEnable = config.services.pipewire.enable;
  cfg.persist.location = {
    session.contents = [
      ".local/state/wireplumber/"
    ];
  };
}
