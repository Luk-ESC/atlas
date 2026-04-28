{ ... }:
{
  name = "codex";
  cfg.persist = {
    session.contents = [ ".codex/" ];
    caches.contents = [ ".codex/cache/" ];
    logs.contents = [ ".codex/log/" ];
  };
}
