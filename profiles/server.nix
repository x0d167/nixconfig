{ ... }:
{
  imports = [
    ../modules/common/host.nix
    ../modules/common/gpg-card.nix
    ../modules/common/security.nix
    ../modules/common/shell.nix
    ../modules/common/tailscale.nix
    ../modules/common/user.nix
    ../modules/common/virtualization.nix
  ];
}
