{ config, pkgs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/zsa-keyboard.nix
    ../../modules/common/yubikey.nix
    ../../modules/common/gpg-card.nix
    ../../modules/common/hyprland.nix
    ../../modules/common/shell.nix
    ../../modules/common/packages.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd = {
      systemd.enable = true;
      luks.devices."luks-0e6bb8a1-6546-4f60-966f-b928b78ffdfc" = {
        device = "/dev/disk/by-uuid/0e6bb8a1-6546-4f60-966f-b928b78ffdfc";
	crypttabExtraOpts = [ "fido2-device=auto" ];
      };
    };
    plymouth = {
      enable = false;
    };
    consoleLogLevel = 3;
    kernelParams = [ "quiet" "splash" ];
  };

  zramSwap.enable = true;



  networking.hostName = "zennix";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    neovim
  ];

  services.openssh = {
    enable = true;
    settings = {
      PubkeyAuthentication = true;
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "26.05";
}
