{pkgs, ...}: {
  # wm packages
  security.pam.services.waylock = {};

  environment.systemPackages = with pkgs; [
    # riverwm pkgs dependencies

    # yes
    river
    wideriver

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
    swaynotificationcenter # TODO: might replace soon idk
    fnott

    # etc utils
    bluez
    bluez-tools
    networkmanagerapplet

    playerctl
    pavucontrol
    pamixer

    stow
  ];
}
