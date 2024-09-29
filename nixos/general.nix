# Genral config to be used across all systems
{
  lib,
  pkgs,
  outputs,
  host,
  ...
}: {
  # ====
  # Boot
  # ====

  # Use latest Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # For better interop
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelModules = [ "kvm-intel" ];

  # ==========
  # Networking
  # ==========

  networking.hostName = host.hostName;
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # ============
  # Nix Settings
  # ============

  # Enable new cli and flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # The only unfree packages allowed are listed here.
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "discord"
  #   ];

  nixpkgs.overlays = [
    outputs.overlays.unstable-packages
  ];

  # ========
  # Packages
  # ========

  environment.systemPackages = with pkgs; [
    neovim
    nano

    firefox

    virtualbox

    file
    eza
    wget
    tree
    git
    alejandra

    htop
    btop
    fastfetch
  ];
  environment.shellAliases = {
    /*
      ls = "eza";
    ll = "eza -l";
    l = "eza -la";
    */
  };
}
