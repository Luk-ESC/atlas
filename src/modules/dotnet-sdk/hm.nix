{ pkgExists, ... }:
rec {
  name = "dotnet-sdk";
  autoEnable = pkgExists name;
  cfg.persist = {
    session.contents = [
      ".dotnet/"
      ".aspnet/"
    ];
    caches.contents = [
      ".nuget/packages/"
      ".nuget/NuGet/NuGet.Config"
      ".templateengine/"
      ".local/share/NuGet/"
    ];
  };

}
