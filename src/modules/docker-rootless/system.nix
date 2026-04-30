{
  config,
  ...
}:
{
  name = "docker-rootless";
  autoEnable = config.virtualisation.docker.rootless.enable;
  cfg.persist.location = {
    data.contents = [ ".local/share/docker/volumes/" ];
    session.contents = [
      ".local/share/docker/"
      ".docker/"
    ];
  };
}
