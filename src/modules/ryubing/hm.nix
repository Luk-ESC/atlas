{ pkgExists, ... }:
rec {
  name = "ryubing";
  autoEnable = pkgExists name;
  cfg.persist = {
    data.contents = [
      ".config/Ryujinx/bis/user/"
    ];

    logs.contents = [
      ".config/Ryujinx/Logs/"
    ];

    session.contents = [
      ".config/Ryujinx/"
    ];
  };
}
