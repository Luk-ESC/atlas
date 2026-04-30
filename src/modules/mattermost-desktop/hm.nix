{ pkgExists, ... }:
rec {
  name = "mattermost-desktop";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".config/Mattermost/" ];
}
