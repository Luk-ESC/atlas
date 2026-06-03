{ lib, config, ... }:
let
  dirs = [
    "desktop"
    "documents"
    "music"
    "pictures"
    "publicShare"
    "templates"
    "videos"
    "projects"
  ];
  absolutePaths = builtins.filter (x: x != null) (map (x: config.xdg.userDirs.${x}) dirs);
  relPaths = map (lib.removePrefix "${config.home.homeDirectory}/") absolutePaths;
  paths = map (x: x + "/") relPaths;
in
{
  name = "xdg";
  autoEnable = config.xdg.userDirs.enable;
  cfg.persist.data.contents = paths;
}
