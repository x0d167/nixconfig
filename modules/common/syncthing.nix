{ ... }:
{
  services.syncthing = {
    enable = true;
    # openDefaultPorts not needed — traffic arrives over tailscale0,
    # already trusted via tailscale.nix's firewall rule.
  };
}
