{...}: {
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
}
