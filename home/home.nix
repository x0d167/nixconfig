{ username, ... }:

{
  imports = [ 
    ./modules/bash.nix
    ./modules/fish.nix
    ./modules/git.nix 
    ./modules/hyprland.nix 
    ./modules/kitty.nix 
    ./modules/packages.nix 
    ./modules/scripts.nix 
    ./modules/ssh.nix 
    ./modules/nix-update-timer.nix 
    ./modules/vicinae.nix
    ./modules/xdg.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
}
