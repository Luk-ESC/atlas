{ config, ... }:
rec {
  name = "prismlauncher";
  autoEnable = config.programs.prismlauncher.enable;
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
