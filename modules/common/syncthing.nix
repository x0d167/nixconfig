{ pkgs, username, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "${username}";
    group = "users";
    dataDir = "/home/${username}";
  };
  networking.firewall.allowedTCPPorts = [ 8384 ];

  environment.systemPackages = [ pkgs.syncthingtray-minimal ];
}
