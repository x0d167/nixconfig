{ ... }:
{
  imports = [
    ../modules/common/audio.nix
    ../modules/common/bluetooth.nix
    ../modules/common/browser.nix
    ../modules/common/gpg-card.nix
    ../modules/common/host.nix
    ../modules/common/hyprland.nix
    ../modules/common/noctalia.nix
    ../modules/common/packages.nix
    ../modules/common/shell.nix
    ../modules/common/user.nix
    ../modules/common/virtualization.nix
    ../modules/common/yubikey.nix
    ../modules/common/zsa-keyboard.nix
    ../modules/common/security.nix
    ../modules/common/syncthing.nix
    ../modules/common/tailscale.nix
  ];
}
