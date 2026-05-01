{ pkgExists, ... }:
rec {
  name = "telegram-desktop";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".local/share/TelegramDesktop/" ];
}
