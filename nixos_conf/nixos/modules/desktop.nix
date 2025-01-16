# desktop.nix
# general desktop configuration
# imports specific desktop use cases such as for `gaming` and `coding`
{ pkgs, ...}:
{
    imports =
    [ # ./desktop/*
        ./desktop/services.nix

        ./desktop/wm.nix
        ./desktop/gaming.nix
		./desktop/coding.nix
    ];

    # enable bluetooth
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    # packages for my desktop environments
    environment.systemPackages = with pkgs;
    [
        # cli utils
        vim
        btop
        htop
        git
        fastfetch
        ffmpeg
		tree

        # etc
        home-manager
        firefox
        librewolf-bin
        vesktop
        gparted
    ];

    # fonts
    fonts.packages = with pkgs;
    [
       noto-fonts
       noto-fonts-cjk-sans
       noto-fonts-cjk-serif
       noto-fonts-emoji
       liberation_ttf
       azuki

       nerd-fonts.jetbrains-mono
       nerd-fonts.fantasque-sans-mono
	   nerd-fonts.commit-mono
    ];
}
