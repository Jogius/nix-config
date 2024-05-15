{
  config,
  pkgs,
  outputs,
  host,
  ...
}: {
  imports = [
    outputs.homeManagerModules.zsh
  ];

  home.username = host.mainUser;
  home.homeDirectory = "/home/${host.mainUser}";

  # Packages that should be installed to the user profile.
  home.packages =
    (with pkgs.unstable; [
      neofetch

      # Utils
      nnn
      zip
      xz
      unzip
      p7zip
      ripgrep
      jq
      fzf

      # Networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      ldns
      socat
      nmap
      iptables
      ipscan
      wireguard-tools
      wireshark-qt

      # Misc
      cowsay
      which
      gnused
      gnutar
      gawk
      zstd
      gparted
      glow
      yubikey-manager-qt

      # Dev tools
      (hiPrio clang)
      clang-tools
      gcc
      gnumake

      # Creative tools
      blender
      gimp

      # Other software
      pkgs.discord

      jetbrains.clion
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      jetbrains.gateway
      jetbrains.rust-rover
      alacritty
    ])
    ++ (with pkgs; [
      yakuake
    ]);

  # git config
  programs.git = {
    enable = true;
    userName = "Julius Makowski";
    userEmail = "julius@themakowskis.de";
    /*
      signing = {
      signByDefault = true;
      key = "65C10FB5A2BF4E55";
    };
    */
    extraConfig = {
      init.defaultbranch = "main";
    };
  };

  home.stateVersion = "23.11"; # Don't change!

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
