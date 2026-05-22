{ config, pkgs, ... }:

{
  networking.hostName = "jolteon-nixos";
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  programs.zsh.enable = true;

  services.tailscale.enable = true;
  services.resolved.enable = true;
  services.openssh.enable = true;

  networking.networkmanager.dns = "systemd-resolved";
  
  networking.dhcpcd.extraConfig = "nohook resolv.conf";

  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;
  
  services.xserver.xkb.layout = "pl";
  console.keyMap = "pl2";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.bush = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.loader.timeout = 5; 

  environment.systemPackages = with pkgs; [
    refind
  ];

  system.stateVersion = "25.11";
}
