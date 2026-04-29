{ pkgs, config, ... }:
let
  base = ".maltego/";
  versionPath = "${base}v${pkgs.maltego.version}";
in
{
  name = "maltego";
  autoEnable = builtins.elem pkgs.maltego config.home.packages;
  cfg.persist = {
    logs.contents = [ "${versionPath}/var/log/" ];
    caches.contents = [ "${versionPath}/var/cache/" ];
    session.contents = [ base ];
  };
}
