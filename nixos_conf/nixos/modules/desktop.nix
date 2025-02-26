# desktop.nix
# general desktop configuration
# imports specific desktop use cases such as for `gaming` and `coding`
{pkgs, ...}: {
  imports = [
    # ./desktop/*
    ./desktop/services.nix
    ./desktop/secureboot.nix

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

  # setup xdg-portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  # set some environment variables
  environment.sessionVariables = {
    FLAKE = "$HOME/dotfiles/nixos_conf/";
    EDITOR = "nvim";
  };

  # packages for my desktop environments
  environment.systemPackages = with pkgs; [
    # cli utils
    vim
    btop
    htop
    git
    ffmpeg
    tree
    lsd
    fastfetch
    pfetch

    # nix helpers
    nh
    nix-output-monitor
    nvd

    # etc
    home-manager
    firefox
    librewolf-bin
    vesktop
    transmission_4-gtk
    gparted
  ];

  # fonts
  fonts.packages = with pkgs; [
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
