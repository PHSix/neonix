{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [ firefox google-chrome ];
}
