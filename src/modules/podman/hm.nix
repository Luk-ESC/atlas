{
  config,
  ...
}:
{
  name = "podman";
  autoEnable = config.services.podman.enable;
  cfg.persist = {
    data.contents = [ ".local/share/containers/storage/volumes/" ];
    caches.contents = [ ".local/share/containers/cache/" ];
    session.contents = [ ".local/share/containers/storage/" ];
  };
}
