{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "";
  };

  xdg.configFile."hypr/hyprland.lua".source = ./dots/hyprland.lua;

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    pyprland
    playerctl
    brightnessctl
  ];
}
