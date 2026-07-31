{ config, username, ... }:
{
  zramSwap.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  system.autoUpgrade = {
    enable = true;
    flake = "path:/home/${username}/.config/nixconfig#${config.networking.hostName}";
    dates = "Sat *-*-* 10:00:00";
    allowReboot = false;
  };

  systemd.services.nixos-upgrade.preStart = ''
    cd /home/${username}/.config/nixconfig
    if [ -n "$(git status --porcelain -- . ':!flake.lock')" ]; then
      echo "Uncommitted changes outside flake.lock detected — aborting autoUpgrade."
      exit 1
    fi
  '';

  nixpkgs.config.allowUnfree = true;
  documentation.man.man-db.enable = true;
  services.udisks2.enable = true;
  services.fstrim.enable = true;
}
