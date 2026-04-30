{ pkgs, config, ... }:
{
  name = "retroarch";
  autoEnable = builtins.any (x: x.name == pkgs.retroarch-free.name) config.home.packages;
  cfg.persist.session.contents = [ ".config/retroarch/" ];
}
