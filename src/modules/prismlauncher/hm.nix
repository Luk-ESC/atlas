{ pkgExists, ... }:
rec {
  name = "prismlauncher";
  autoEnable = pkgExists name;
  cfg.persist = {
    data.contents = [
      ".local/share/PrismLauncher/"
    ];

    logs.contents = [
      ".local/share/PrismLauncher/logs/"
    ];

    caches.contents = [
      ".local/share/PrismLauncher/cache/"
    ];
  };
}
