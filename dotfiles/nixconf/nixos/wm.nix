{pkgs, ...}:
{
  services.gvfs.enable = true;
  programs.dconf.enable = true;
  security.polkit.enable = true;
  services.printing.enable = true;

    systemd = {
      # polkit
      user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
        };
    };
    # # river lock on suspend
    # user.services.riverlock = {
    #     description = "Lock riverwm";
    #     before = [ "sleep.target" ];
    #     wantedBy = [ "suspend.target" ];
    #     environment = { DISPLAY=":0"; };
    #       serviceConfig = {
    #           Type = "forking";
    #           ExecStart = "${pkgs.waylock}/usr/bin/waylock -fork-on-lock -init-color 0x333333 -input-color 0xc5c9c5";
    #         };
    #   };
  };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command ="${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd river";
          user = "greeter";
          };
       };
    };

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  security.pam.services.waylock = {};
  environment.systemPackages = with pkgs; [
   kanshi
   wlr-randr
   swaybg
   waylock
   brightnessctl
   waybar
   rofi-wayland
   rofimoji
   wl-clipboard
   bluez
   bluez-tools
   swaynotificationcenter
   libnotify

   kitty
   nemo
   obsidian
   gparted

   playerctl
   pavucontrol
   pamixer

   river
   wideriver
  ];
}
