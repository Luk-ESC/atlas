{
  config,
  ...
}:
{
  name = "ssh";
  autoEnable = config.programs.ssh.enable;
  cfg.persist = {
    session.contents = [
      {
        directory = ".ssh/";
        mode = "0700";
      }

    ];
    data.contents = [
      {
        file = ".ssh/authorized_keys";
        mode = "0700";
      }
    ];
  };
}
