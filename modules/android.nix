{ pkgs, ... }: {
  # programs.adb.enable = true;
  programs.adb.enable = true;
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
    flutter
    kotlin

    # for linux platform
    gtk3
    ninja
    pkg-config
  ];
}
