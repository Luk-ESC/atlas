{ pkgs, config, ... }:
{
  name = "teams-for-linux";
  autoEnable = builtins.elem pkgs.teams-for-linux config.home.packages;
  cfg.persist.session.contents = [ ".config/teams-for-linux/" ];
}
