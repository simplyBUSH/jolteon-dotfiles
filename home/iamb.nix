{ config, pkgs, ... }:

{
  programs.iamb = {
    enable = true;
    
    settings = {
      default_profile = "bush";
      
      profiles = {
        Zerda = {
          user_id = "@bush:simplybush.pl";
        };
      };
      
      settings = {
        notifications.enabled = true;
        image_preview.protocol = {
          type = "kitty";
          size = {
            height = 10;
            width = 66;
          };
        };
      };
    };
  };
}
