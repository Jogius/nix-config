{
  lib,
  inputs,
  outputs,
  ...
} @ args: rec {
  hostName = "sus";
  modules =
    [
      ./hardware-configuration.nix
      ({...}: {system.stateVersion = "23.05";}) # Don't change!
    ]
    ++ (with outputs.nixosModules; [
      general
      home-manager

      plasma-xorg
    ]);
}
