{ config, ... }:
let
  # TODO: realPath?
  histPath = config.persist.data.prefix + "data" + config.home.homeDirectory + "/.zsh_history";
  cachePath = config.persist.caches.prefix + "caches" + config.home.homeDirectory + "/.zcompdump";
in
{
  name = "zsh";
  autoEnable = config.programs.zsh.enable;
  cfg = {
    programs.zsh = {
      history.path = histPath;
      completionInit = ''
        autoload -U compinit && compinit -d ${cachePath}
      '';
    };

    atlas.extraPaths = [
      histPath
      cachePath
    ];
  };
}
