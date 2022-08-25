# boot/gpu/nix/network and so on
#

{ pkgs, config, lib, ... }:
let
  useProxy = false;
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in {
  boot = {
    plymouth.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
    };
  };

  programs.adb.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  environment.systemPackages = [ nvidia-offload ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      prime = {
        # nix-shell -p pciutils --run lspci
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  system.stateVersion = "22.11";
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # useDHCP = true;
    proxy = if builtins.isString useProxy then {
      httpProxy = useProxy;
      httpsProxy = useProxy;
    } else
      { };
  };

  nix = {
    # package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      flake-registry = https://cdn.jsdelivr.net/gh/NixOS/flake-registry/flake-registry.json
    '';
    settings = {
      substituters = lib.mkForce [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 5d";
      dates = "Sun 19:00";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowAliases = false;
  };
}
