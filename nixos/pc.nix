# Settings for personal machines like Desktops or Laptops
{ pkgs, inputs, ... }: {
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable support for Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Fonts
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # pathched default fonts
      dejavu_fonts
      #freefont_ttf # breaks things
      gyre-fonts # TrueType substitutes for standard PostScript fonts
      liberation_ttf
      unifont
      noto-fonts-color-emoji

      # custom fonts
      meslo-lgs-nf
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" ]; })
    ];
  };
  # tty font
  console.font = "Lat2-Terminus16";

  # Automatically update system
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      # "--no-write-lock-file"
      "-L" # print build logs
    ];
    dates = "daily";
    randomizedDelaySec = "5min";
  };

  environment.systemPackages = with pkgs.unstable; [
    firefox
    vscodium
  ];
}

