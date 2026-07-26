{
  config,
  username,
  ...
}:
let
  peers = import ./peers.nix;
  otherDevices = removeAttrs peers [ config.networking.hostName ];
in
{
  services.syncthing = {
    enable = true;
    user = username;
    group = "users";
    guiAddress = "localhost:8384";
    guiPasswordFile = "/etc/syncthing-gui-password";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      gui.user = config.networking.hostName;
      devices = builtins.mapAttrs (name: peer: {
        id = peer.syncthingId;
        addresses = [ "tcp://${peer.tailscaleHost}:22000" ];
      }) otherDevices;
      folders."sync" = {
        path = "/home/grip/sync";
        devices = builtins.attrNames otherDevices;
      };
    };
  };
}
