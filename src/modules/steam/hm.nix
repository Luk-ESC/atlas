{ pkgs, config, ... }:
{
  name = "steam";
  autoEnable = builtins.elem pkgs.steam config.home.packages;
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
