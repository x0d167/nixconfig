{ ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [
      "10.0.0.0/8"
      "172.16.0.0/12"
      "192.168.0.0/16"
      "nixos.wiki"
    ];
    bantime = "24h";
    bantime-increment = {
      enable = true;
      formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
      maxtime = "168h";
      overalljails = true;
    };
    jails = {
      sshd.settings = {
        enabled = true;
        filter = "sshd";
        backend = "systemd";
        maxretry = 5;
        findtime = 600;
      };
    };
  };

  services.udisks2.enable = true;
  documentation.man.man-db.enable = true;

  networking.firewall.enable = true;
}
