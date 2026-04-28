{ ... }:
{
  name = "cargo";
  cfg.persist = {
    session.contents = [ ".cargo/" ];
    caches.contents = [ ".cargo/registry/cache/" ];
  };
}
