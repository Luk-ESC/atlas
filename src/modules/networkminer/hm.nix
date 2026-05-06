{ pkgExists, ... }:
rec {
  name = "networkminer";
  autoEnable = pkgExists name;
  cfg.persist =
    let
      base = ".local/share/NetworkMiner";
    in
    {
      caches.contents = [ "${base}/AssembledFiles/cache/" ];
      data.contents = [ "${base}/Captures/" ];
    };
}
