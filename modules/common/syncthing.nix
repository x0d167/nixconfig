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

  systemd.user.services.syncthingtray = {
    description = "Syncthing Tray";
    after = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.syncthingtray}/bin/syncthingtray --wait";
      Restart = "on-failure";
      RestartSec = 1;
      Type = "simple";
    };
  };

  environment.systemPackages = [ pkgs.syncthingtray-minimal ];
}
