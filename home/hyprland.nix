{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    
    configType = "hyprlang";
    
    settings = {
      "$mainMod" = "SUPER";

    input = { kb_layout = "pl"; };
    
    animations = { enabled = false; };
    
    general = {
    gaps_in = 10;
	gaps_out = 5;
	border_size = 4;

	"col.active_border" = "rgba(fffd33ff)";
	"col.inactive_border" = "rgba(00000000)";

	layout = "dwindle";
    
    exec-once = [
        "waybar"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      };

      bind = [

      "$mainMod, Q, killactive,"
        
      "$mainMod, SPACE, exec, wofi --show drun"

      "$mainMod SHIFT, SPACE, togglefloating,"

      "$mainMod SHIFT, RETURN, exec, kitty"
      "$mainMod SHIFT, T, exec, kitty -e tmux new-session -A -s auto"
      "$mainMod SHIFT, W, exec, firefox"
      "$mainMod SHIFT, E, exec, nautilus"
      "$mainMod SHIFT, V, exec, vesktop"
      "$mainMod SHIFT, M, exec, element-desktop"

      "$mainMod SHIFT, R, exec, hyprctl reload"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bindl = [
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    };
  };
}
