{ config, pkgs, ... }:

{
  imports = [
    ./home/element-desktop.nix
    ./home/git.nix
    ./home/hyprland.nix
    ./home/kitty.nix
    ./home/vesktop.nix
    ./home/waybar.nix 
    ./home/wofi.nix    
    ./home/zsh.nix
    ./home/iamb.nix
  ];

  home.username = "bush";
  home.homeDirectory = "/home/bush";

  home.packages = with pkgs; [
    btop
    eza
    fastfetch
    firefox
    mosh
    nautilus
    neovim
    nvtopPackages.amd
    spotify
    tmux
  ];

  programs.home-manager.enable = true;
  xdg.configFile."nvim".source = ./configs/nvim;
  home.file.".tmux.conf".source = ./configs/tmux/tmux.conf;

  home.stateVersion = "25.11";
}
