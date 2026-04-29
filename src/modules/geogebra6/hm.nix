{ pkgs, config, ... }:
{
  name = "geogebra6";
  autoEnable = builtins.elem pkgs.geogebra6 config.home.packages;
  cfg.persist.session.contents = [ ".config/GeoGebra/" ];
}
