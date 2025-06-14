{
  pkgs,
  lib,
  config,
  ...
}: {
  # i might make this a module bundle later
  # if i decide to use more window managers/desktop environments
  options = {
    wm.enable = lib.mkEnableOption "enables wm.nix module";
  };

  config = lib.mkIf config.wm.enable {
    # setup xdg-portal
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      configPackages = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };

    security.pam.services.waylock = {};

    # for nh and i forgor
    environment.sessionVariables = {
      NH_FLAKE = "$HOME/dotfiles/nixos_config/";
      EDITOR = "nvim";
    };

    # force enable unfree nixpkgs
    nixpkgs.config.allowUnfree = lib.mkForce true;

    # - wms -
    # wayland
    programs.river.enable = true;
    programs.river.xwayland.enable = true;

    # x.org
    services.xserver = {
      enable = true;
      autorun = false;
      displayManager.startx.enable = true;

      windowManager.berry.enable = true;
    };

    programs.firejail.enable = true;
    environment.systemPackages = with pkgs; [
      # river
      wideriver
      stow

      # x.org
      sxhkd

      # monitor management
      kanshi
      wlr-randr
      brightnessctl

      # wayland utils
      swaybg
      waylock
      waybar
      brightnessctl
      wl-clipboard
      rofi-wayland
      rofimoji
      libnotify
      fnott

      # etc utils
      bluez
      bluez-tools
      networkmanagerapplet
      playerctl
      pavucontrol
      pamixer

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
      ntfs3g
      gparted

      # etc etc
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
      obsidian
      obs-studio
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
  };
}
