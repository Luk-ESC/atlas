{ ... }:
{
  name = "libreoffice";
  cfg.persist = {
    session.contents = [ ".config/libreoffice/4/user/" ];
    caches.contents = [ ".config/libreoffice/4/cache/" ];
  };
}
