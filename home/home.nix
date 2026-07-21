{ username, ... }:

{
  imports = [ ./modules/git.nix ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
}
