{ pkgExists, ... }:
rec {
  name = "teams-for-linux";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".config/teams-for-linux/" ];
}
