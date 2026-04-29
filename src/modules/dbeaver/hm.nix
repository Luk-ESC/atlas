{ pkgs, config, ... }:
{
  name = "dbeaver";
  autoEnable = builtins.elem pkgs.dbeaver-bin config.home.packages;
  cfg.persist = {
    data.contents = [ ".local/share/DBeaverData/" ];
    session.contents = [ ".local/share/DBeaverData/drivers/" ];
    # TODO: move .eclipse somewhere else?
    caches.contents = [ ".eclipse/" ];
  };
}
