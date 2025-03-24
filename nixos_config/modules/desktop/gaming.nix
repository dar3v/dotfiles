{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];

  options = {
    gaming = lib.mkEnableOption "install and configure all my gaming needs";
  };

  config = lib.mkIf config.gaming {
    # aagl
    nix.settings = inputs.aagl.nixConfig;
    programs.anime-game-launcher.enable = true;

    # enable steam
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      # add missing dependencies for gamescope
      package = pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
          ];
      };
    };

    programs.gamemode.enable = true;

    # razer stuffs
    hardware.openrazer.enable = true;
    users.users.dar3v = {extraGroups = ["openrazer"];};

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # install gaming related packages
    environment.systemPackages = with pkgs; [
      protonup
      mangohud

      bottles # not necessarily for gaming but yes
      superTuxKart

      # razer stuffs
      polychromatic
      openrazer-daemon
    ];
  };
}
