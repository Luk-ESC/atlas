{ pkgs, pkgExists, ... }:
let
  base = ".maltego/";
  versionPath = "${base}v${pkgs.maltego.version}";
in
rec {
  name = "maltego";
  autoEnable = pkgExists name;
  cfg.persist = {
    logs.contents = [ "${versionPath}/var/log/" ];
    caches.contents = [ "${versionPath}/var/cache/" ];
    session.contents = [ base ];
  };
}
