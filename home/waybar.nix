{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "tray" ];
        
        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: monospace;
        font-size: 14px;
      }
      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
      }
      #workspaces button {
        padding: 0 10px;
        color: #6c7086;
      }
      #workspaces button.active {
        color: #b4befe;
      }
      #clock, #pulseaudio, #network, #tray {
        padding: 0 15px;
      }
    '';
  };
}
