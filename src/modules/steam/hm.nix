{ pkgExists, ... }:
rec {
  name = "steam";
  autoEnable = pkgExists name;
  cfg.persist = {
    logs.contents = [
      ".local/share/Steam/logs/"
    ];

    caches.contents = [
      ".local/share/Steam/appcache/"
      ".local/share/Steam/steamapps/shadercache/"
    ];

    session.contents = [
      ".local/share/Steam/"
      ".steam/"
    ];
  };
}
