{ config, ... }:
{
  name = "howdy";
  autoEnable = config.services.howdy.enable;
  cfg.persist.location.session.contents = [
    "/var/lib/howdy/"
  ];
}
