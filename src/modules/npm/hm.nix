{ ... }:
{
  name = "npm";
  cfg.persist.caches.contents = [ ".npm/_cacache/" ];
  cfg.persist.logs.contents = [ ".npm/_logs/" ];
  cfg.persist.session.contents = [ ".npm/_update-notifier-last-checked" ];
}
