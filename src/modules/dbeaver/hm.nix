{ pkgExists, ... }:
{
  name = "dbeaver";
  autoEnable = pkgExists "dbeaver-bin";
  cfg.persist = {
    data.contents = [ ".local/share/DBeaverData/" ];
    session.contents = [ ".local/share/DBeaverData/drivers/" ];
    # TODO: move .eclipse somewhere else?
    caches.contents = [ ".eclipse/" ];
  };
}
