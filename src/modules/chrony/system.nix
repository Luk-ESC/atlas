{ config, ... }:
{
  name = "chrony";
  autoEnable = config.services.chrony.enable;
  cfg.persist.location.caches.contents = [ "/var/lib/chrony/" ];
}
