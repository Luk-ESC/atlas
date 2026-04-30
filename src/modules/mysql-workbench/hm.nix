{ pkgExists, ... }:
rec {
  name = "mysql-workbench";
  autoEnable = pkgExists name;
  cfg.persist = {
    session.contents = [ ".mysql/workbench/" ];
    logs.contents = [ ".mysql/workbench/log/" ];
  };
}
