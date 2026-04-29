{ pkgs, config, ... }:
{
  name = "burpsuite";
  autoEnable = builtins.elem pkgs.burpsuite config.home.packages;
  cfg.persist.session.contents = [
    ".BurpSuite/"
    ".java/.userPrefs/burp/"
  ];
}
