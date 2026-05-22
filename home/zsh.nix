{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    localVariables = {
      PROMPT = "[%n@%F{#fffd33}jolteon%f %~]%% ";
    };

    history = {
      size = 100000;
      save = 100000;
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      cls = "clear";
      iamb = "iamb -C ~/.config"; 
      kys = "tmux kill-server";
      ll = "eza -lha --git";
      ns = "nix-shell";
      q = "exit";
      sdr = "sudo nixos-rebuild switch --flake ~/nix-config/.#jolteon-nixos";
      size = "du -sh .";
      ts = "tailscale";
    };
    
    initContent = lib.mkMerge [
      (lib.mkBefore ''
        autoload -Uz compinit
        if [[ -n ''${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
          compinit
        else
          compinit -C
        fi
      '')
    ];
  };
}
