{pkgs, ...}: {
  imports = [
    # yes
    ./modules/gammastep.nix
    ./modules/theme.nix
    ./modules/nvim.nix
    ./modules/syncthing.nix
  ];

  home = {
    username = "dar3v";
    homeDirectory = "/home/dar3v";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  # i moved these to wm.nix
    # nemo
    # kitty
    # imv
    # fzf
    # mpv
    # mpd
    # ani-cli
    # nvtopPackages.full
    # grim
    # slurp
    # yazi
    # obsidian
  ];
}
