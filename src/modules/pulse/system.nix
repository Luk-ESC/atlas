{
  config,
  ...
}:
{
  name = "pulse";
  autoEnable = config.services.pipewire.pulse.enable;
  cfg.persist.location = {
    session.contents = [
      ".config/pulse/"
    ];
  };
}
