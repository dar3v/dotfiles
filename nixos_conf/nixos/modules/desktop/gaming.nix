{pkgs, ...}:
{
    # enable an anime game launcher
    programs.anime-game-launcher.enable = true;

    # enable steam
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    # enable gamemode & gamescope
    programs = { 
		gamemode.enable = true;
		gamescope = {
			enable = true;
			capSysNice = true;
		};
	};

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # install gaming related packages
    environment.systemPackages = with pkgs; [
      protonup
      mangohud
	  superTuxKart

	  # not necessarily for gaming but yes
	  bottles
    ];
}
