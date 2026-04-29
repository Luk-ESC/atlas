{ pkgs, config, ... }:
{
  name = "mattermost-desktop";
  autoEnable = builtins.elem pkgs.mattermost-desktop config.home.packages;
  cfg.persist.session.contents = [ ".config/Mattermost/" ];
}
