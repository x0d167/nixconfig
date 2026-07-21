{ pkgs, username, ... }:

{
  security.pam.u2f = {
    enable = true;
    control = "sufficient"; # yubikey touch OR password — not AND
    settings = {
      cue = true; # prints "please touch" prompt
      authFile = "/home/${username}/.config/Yubico/u2f_keys";
    };
  };

  security.pam.services.sudo.u2fAuth = true;

  environment.systemPackages = with pkgs; [ pam_u2f yubikey-manager ];
}
