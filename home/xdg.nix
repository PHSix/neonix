{ pkgs, config, ... }: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
# if config.services.xserver.enable then {
#   xdg.userDirs = {
#     enable = true;
#     createDirectories = true;
#   };
# } else
#   { }
