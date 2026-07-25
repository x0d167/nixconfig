# home/modules/ssh.nix
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        addKeysToAgent = "1h";
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
        forwardAgent = false;
        compression = false;
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };

      zennix = {
        hostname = "zennix.bonobo-egret.ts.net";
        user = "grip";
      };
      echo = {
        hostname = "echo.bonobo-egret.ts.net";
        user = "grip";
      };
      iona = {
        hostname = "iona.bonobo-egret.ts.net";
        user = "grip";
      };
      proxmox = {
        hostname = "acheron.bonobo-egret.ts.net";
        user = "root";
      };
      ixia = {
        hostname = "ixia.bonobo-egret.ts.net";
        user = "grip";
      };
      xena = {
        hostname = "xena.bonobo-egret.ts.net";
        user = "grip";
      };
      k480x = {
        hostname = "k480x.bonobo-egret.ts.net";
        user = "grip";
      };
    };
  };
}
