# Shared configs for various aspects
{
  general = import ./general.nix;
  home-manager = import ./home-manager.nix;

  auth = import ./auth.nix;
  locale = import ./locale.nix;
  pc = import ./pc.nix;
  plasma-xorg = import ./plasma-xorg.nix;
  virtualisation = import ./virtualisation.nix;
}
