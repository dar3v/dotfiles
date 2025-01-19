{ pkgs, ... }:
{
    imports =
    [ # yes
        ./modules/gammastep.nix
        ./modules/theme.nix
        ./modules/nvim.nix
    ];

    home = {
        username = "dar3v";
        homeDirectory = "/home/dar3v";
        stateVersion = "25.05";

        sessionVariables = {
            EDITOR = "nvim";
            MANPAGER = "nvim +Man!";
        };
    };

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs;
    [
        nemo
        kitty
        imv
        fzf
        mpv
        mpd
        ani-cli
        nvtopPackages.full
        grim
        slurp
        yazi
    ];
}
