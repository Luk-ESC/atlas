{ lib, ... }:
{
  options.atlas.extraPaths =
    with lib.types;
    lib.mkOption {
      type = listOf str;
      default = [ ];
    };
}
