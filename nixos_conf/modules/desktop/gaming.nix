{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    gaming = lib.mkOption "install and configure all my gaming needs";
  };

  config = lib.mkIf config.gaming {
    # aagl
    imports = [inputs.aagl.nixosModules.default];
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

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # install gaming related packages
    environment.systemPackages = with pkgs; [
      protonup
      mangohud

      bottles # not necessarily for gaming but yes
      superTuxKart
    ];
  };
}
