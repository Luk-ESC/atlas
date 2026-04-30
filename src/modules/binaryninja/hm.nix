{ pkgExists, ... }:
{
  name = "binaryninja";
  autoEnable = pkgExists "binaryninja-free";
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
