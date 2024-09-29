{host, ...}: {
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [host.mainUser];

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [host.mainUser];
}
