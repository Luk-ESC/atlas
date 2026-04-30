{ pkgExists, ... }:
rec {
  name = "burpsuite";
  autoEnable = pkgExists name;
  cfg.persist.session.contents = [
    ".BurpSuite/"
    ".java/.userPrefs/burp/"
  ];
}
