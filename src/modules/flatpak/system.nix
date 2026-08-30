{ config, ... }: {
  name = "flatpak";
  autoEnable = config.services.flatpak.enable;
  cfg.persist.location.session.contents = [
    "/var/lib/flatpak/"
    ".var/app/"
    ".local/share/flatpak/"
  ];
}
