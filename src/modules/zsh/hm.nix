{ config, realPath, ... }:
let
  histPath = realPath "data" ".zsh_history";
  cachePath = realPath "caches" ".zcompdump";
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
