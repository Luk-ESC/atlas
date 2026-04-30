{ ... }:
{
  name = "base";
  autoEnable = true;
  cfg.persist.location = {
    data.contents = [
      "/var/lib/nixos/"
      "/etc/machine-id"
    ];

    caches.contents = [
      "/var/cache/"
    ];

    logs.contents = [
      "/var/log/"
    ];
  };
}
