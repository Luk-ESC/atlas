{ pkgs, config, ... }:
{
  name = "retroarch";
  autoEnable = builtins.elem pkgs.retroarch-free config.home.packages;
  cfg.persist.session.contents = [ ".config/retroarch/" ];
}
