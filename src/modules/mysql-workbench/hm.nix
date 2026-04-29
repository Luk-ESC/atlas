{ pkgs, config, ... }:
{
  name = "mysql-workbench";
  autoEnable = builtins.elem pkgs.mysql-workbench config.home.packages;
  cfg.persist = {
    session.contents = [ ".mysql/workbench/" ];
    logs.contents = [ ".mysql/workbench/log/" ];
  };
}
