{ config, pkgs, ... }:

{
  imports = [
    ./home/hyprland.nix
    ./home/kitty.nix
    ./home/zsh.nix
    ./home/wofi.nix    
    ./home/git.nix
    ./home/element-desktop.nix
  ];

  home.username = "bush";
  home.homeDirectory = "/home/bush";

  home.packages = with pkgs; [
    btop
    eza
    fastfetch
    firefox
    neovim
    tmux
  ];

  programs.home-manager.enable = true;
  xdg.configFile."nvim".source = ./configs/nvim;
  home.file.".tmux.conf".source = ./configs/tmux/tmux.conf;

  home.stateVersion = "25.11";
}
