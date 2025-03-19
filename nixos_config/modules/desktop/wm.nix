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
      configPackages = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };

    security.pam.services.waylock = {};

    # for nh and i forgor
    environment.sessionVariables = {
      FLAKE = "$HOME/dotfiles/nixos_config/";
      EDITOR = "nvim";
    };

    # force enable unfree nixpkgs
    nixpkgs.config.allowUnfree = lib.mkForce true;

    environment.systemPackages = with pkgs; [
      # -- riverwm pkgs dependencies --
      river
      wideriver
      stow

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
