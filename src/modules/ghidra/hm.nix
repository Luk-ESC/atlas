{ pkgs, pkgExists, ... }:
let
  base = ".config/ghidra";
  releaseName = "NIX";
  distroPrefix = "ghidra_${pkgs.ghidra.version}_${releaseName}";
  versionPath = "${base}/${distroPrefix}";
in
rec {
  name = "ghidra";
  autoEnable = pkgExists name;
  cfg.persist = {
    session.contents = [
      "${base}/lastrun"
      "${versionPath}/"
    ];
    logs.contents = [
      "${versionPath}/application.log"
      "${versionPath}/script.log"
    ];
  };
}
