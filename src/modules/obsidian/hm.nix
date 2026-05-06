{ pkgExists, ... }:
rec {
  name = "obsidian";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".config/obsidian/" ];
}
