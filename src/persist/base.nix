{ lib, ... }:
rec {
  persistentOption =
    with lib;
    with lib.types;
    mkOption {
      description = "persistent file or directory";
      type = attrsOf (submodule {
        options = {
          prefix = mkOption {
            default = "/persistent/";
            type = strMatching "^/([[:alnum:]_]+/)?$";
          };
          contents = mkOption {
            default = [ ];
            type = listOf (
              coercedTo str
                (
                  s:
                  if lib.hasSuffix "/" s then
                    {
                      directory = lib.removeSuffix "/" s;
                    }
                  else
                    { file = s; }
                )
                (submodule {
                  options = {
                    directory = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Path to directory.";
                    };
                    mode = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Permissions mode for directory (e.g., 0700). Does not apply to file.";
                    };
                    group = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Group of directory (e.g., root). Does not apply to file.";
                    };
                    user = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Owner of directory (e.g., root). Does not apply to file.";
                    };
                    file = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Path to file.";
                    };
                  };
                })
            );
          };
        };
      });
    };

  getPath = p: if p.directory != null then p.directory else p.file;
  isDirectory = p: p.directory != null;
  isSystem = p: lib.hasPrefix "/" (getPath p);

  entrySettings =
    e:
    lib.filterAttrs (_: v: v != null) {
      inherit (e) mode user group;
    };

  transformFile =
    e:
    let
      s = entrySettings e;
    in
    {
      inherit (e) file;
    }
    // lib.optionalAttrs (s != { }) { parentDirectory = s; };

  transformDir =
    e:
    {
      inherit (e) directory;
    }
    // (entrySettings e);

  transformItem = dir: if dir then transformDir else transformFile;
  filterItems = system: dir: builtins.filter (x: (isSystem x) == system && (isDirectory x) == dir);
  parseFull =
    paths: system: dir:
    map (transformItem dir) (filterItems system dir paths);

  dirsAndFiles = system: contents: {
    directories = parseFull contents system true;
    files = parseFull contents system false;
  };
}
