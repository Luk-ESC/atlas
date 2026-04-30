{ pkgExists, ... }:
{
  name = "ida";
  autoEnable = pkgExists "ida-pro";
  cfg.persist.session.contents = [ ".idapro/" ];
}
