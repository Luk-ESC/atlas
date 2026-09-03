{ config, ... }:
{
  name = "tailscale";
  autoEnable = config.services.tailscale.enable;
  cfg.persist.location.session.contents = [
    "/var/lib/tailscale/"
  ];
}
