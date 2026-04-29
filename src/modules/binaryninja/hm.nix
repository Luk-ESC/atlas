{ pkgs, config, ... }:
{
  name = "binaryninja";
  autoEnable = builtins.elem pkgs.binaryninja-free config.home.packages;
  cfg.persist = {
    data.contents = [
      ".config/Vector 35/Binary Ninja.conf"
      ".binaryninja/plugins/"
      ".binaryninja/license.dat"
    ];

    session.contents = [
      ".binaryninja/"
    ];
  };
}
