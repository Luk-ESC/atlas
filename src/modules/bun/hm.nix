{ pkgs, config, ... }:
{
  name = "bun";
  autoEnable = builtins.elem pkgs.bun config.home.packages;
  cfg.persist.caches.contents = [ ".bun/install/cache/" ];
}
