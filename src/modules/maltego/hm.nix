{
  pkgs,
  ...
}:
let
  base = ".maltego/";
  versionPath = "${base}v${pkgs.maltego.version}";
in
{
  name = "maltego";
  cfg.persist = {
    logs.contents = [ "${versionPath}/var/log/" ];
    caches.contents = [ "${versionPath}/var/cache/" ];
    session.contents = [ base ];
  };
}
