{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    
    settings = {
      allow_images = true;
      allow_markup = true;
      width = 600;
      height = 400;
      prompt = "Search...";
    };

    style = ''
      * {
        font-family: monospace;
      }
      
      window {
        background-color: #1e1e2e;
        color: #cdd6f4;
        border: 2px solid #b4befe;
        border-radius: 10px;
      }
      
      #input {
        background-color: #181825;
        color: #cdd6f4;
        border: none;
        border-bottom: 2px solid #313244;
        margin: 10px;
        padding: 10px;
        border-radius: 5px;
      }
      
      #inner-box {
        margin: 10px;
      }
      
      #entry {
        padding: 5px;
        border-radius: 5px;
      }
      
      #entry:selected {
        background-color: #313244;
        color: #b4befe;
      }
    '';
  };
}
