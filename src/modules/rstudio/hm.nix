{ ... }:
{
  name = "rstudio";
  cfg.persist.session.contents = [
    ".config/RStudio/"
    ".local/share/rstudio/"
  ];
}
