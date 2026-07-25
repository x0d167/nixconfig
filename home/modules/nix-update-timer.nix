{ pkgs, ...}:

{
  systemd.user.services.flake-update = {
    Unit.Description = "Weekly nix flake update";
    Service = {
      Type = "oneshot";
      WorkingDirectory = "%h/.config/nixconfig";
      ExecStart = "${pkgs.nix}/bin/nix flake update";
    };
  };
  
  systemd.user.timers.flake-update = {
    Unit.Description = "Weekly nix flake update timer";
    Timer = {
      OnCalendar = "weekly";
      Persistent = true;  # catches up if machine was off
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
