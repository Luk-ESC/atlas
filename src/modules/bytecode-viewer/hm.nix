{ pkgExists, ... }:
rec {
  name = "bytecode-viewer";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".Bytecode-Viewer/" ];
}
