{
  lib,
  config,
  pkgs,
  ...
}: {

  options = {
    config.polkit.configure = lib.mkEnableOption "configures and enables polkit";
  };
  config = lib.mkIf config.polkit.configure {
    systemd = {
      config = lib.mkIf config.polkit.configure {
        user.services.polkit-gnome-authentication-agent-1 = {
          description = "polkit-gnome-authentication-agent-1";
          wantedBy = ["graphical-session.target"];
          wants = ["graphical-session.target"];
          after = ["graphical-session.target"];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
        };
      };
    };
  };
}
