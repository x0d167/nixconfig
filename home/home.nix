{ username, ... }:

{
  imports = [ 
    ./modules/bash.nix
    ./modules/fish.nix
    ./modules/git.nix 
    ./modules/hyprland.nix 
    ./modules/kitty.nix 
    ./modules/scripts.nix 
    ./modules/vicinae.nix
    ./modules/xdg.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
}
