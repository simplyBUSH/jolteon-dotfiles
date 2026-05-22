{ config, pkgs, ... }:

{
  console.keyMap = "pl2";
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false; 

  environment.systemPackages = with pkgs; [
    refind 
    pavucontrol
  ];

  imports = [
    ./hardware-configuration.nix
    ./home/steam.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true; 
    loader.timeout = 5; 
    kernel.sysctl."vm.swappiness" = 180;
  };
  
  environment.cinnamon.excludePackages = with pkgs; [
    gnome-calendar
    gnome-screenshot
    gnome-calculator
    gnome-system-monitor
    eog
    evince

    celluloid                     # Celluloid (Media Player)
    pix                  # Pix (Image Management)
    xreader              # Document Viewer / File Reader
    xviewer              # Image Viewer
    warpinator           # Warpinator
    file-roller                   # File Roller (Archive Manager)
    gucharmap                     # Character Map
    onboard                       # Virtual Keyboard
    xed-editor
  ];
  
  services = {
    displayManager.ly.enable = true;
    openssh.enable = true;
    resolved.enable = true;
    tailscale.enable = true;
    xserver.desktopManager.cinnamon.enable = true;
    xserver.xkb.layout = "pl";
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xrdp = {
      enable = true;
      defaultWindowManager = "cinnamon-session";
    };
  };
  
  networking = {
    dhcpcd.extraConfig = "nohook resolv.conf";
    hostName = "jolteon-nixos";
    networkmanager.dns = "systemd-resolved";
    interfaces."enp7s0".wakeOnLan.enable = true;
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.bush = {
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  zramSwap = {
    algorithm = "zstd";
    enable = true;
    memoryPercent = 100;
  };
}
