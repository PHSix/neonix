{ pkgs, ... }: {
  # programs.adb.enable = true;
  home.packages = with pkgs; [ android-studio android-tools flutter kotlin ];
}
