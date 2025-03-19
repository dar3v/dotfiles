{...}: {
  imports = [
    # yes
    ./modules/gammastep.nix
    ./modules/theme.nix
    ./modules/syncthing.nix
    ./modules/dev.nix
    ./modules/nvim.nix
  ];

  home = {
    username = "dar3v";
    homeDirectory = "/home/dar3v";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;
}
