{ ... }:
{
  name = "mysql-workbench";
  cfg.persist = {
    session.contents = [ ".mysql/workbench/" ];
    logs.contents = [ ".mysql/workbench/log/" ];
  };
}
