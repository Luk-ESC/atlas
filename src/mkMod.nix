{
  lib,
  config,
  ...
}:
{
  name,
  cfg,
  autoEnable ? false,
}:
{
  options.atlas.${name} = {
    enable = lib.mkOption {
      default = autoEnable;
      example = true;
      description = "Whether to enable persistence for ${name}.";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.atlas.${name}.enable cfg;
}
