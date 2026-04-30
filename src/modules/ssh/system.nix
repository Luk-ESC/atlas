{ config, ... }:
{
  name = "openssh";
  autoEnable = config.services.openssh.enable;
  cfg.persist.location.session.contents = [
    "/etc/ssh"
  ];
}
