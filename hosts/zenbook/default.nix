{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/asus.nix
    ../../profiles/laptop.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
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
  };

  networking.hostName = "zennix";

  system.stateVersion = "26.05";
}
