{ pkgExists, ... }:
rec {
  name = "hyprland";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".local/share/hyprland/lastVersion" ];
}
