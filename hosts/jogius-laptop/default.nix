{
  lib,
  inputs,
  outputs,
  ...
} @ args: rec {
  hostName = "jogius-laptop";
  modules =
    [
      ./hardware-configuration.nix
      ({...}: {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        boot.initrd.luks.devices."luks-c6ccc9e0-74e7-480c-ba46-9523db96e8f8".device = "/dev/disk/by-uuid/c6ccc9e0-74e7-480c-ba46-9523db96e8f8";
        system.stateVersion = "23.05";
      }) # Don't change!
    ]
    ++ (with outputs.nixosModules; [
      general
      home-manager

      plasma-xorg
      pc
      locale
    ]);
}
