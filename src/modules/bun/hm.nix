{ config, ... }:
{
  name = "bun";
  autoEnable = config.programs.bun.enable;
  cfg.persist.caches.contents = [ ".bun/install/cache/" ];
}
