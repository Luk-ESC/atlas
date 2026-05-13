{ pkgExists, ... }:
rec {
  name = "metasploit-framework";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [ ".msf4/" ];
}
