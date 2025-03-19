{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # dev stuff
    devenv
    gnumake
    godot_4

    # some utils
    p7zip
    zip
    unzip
    gcc
    ripgrep
    lazygit

    # terminal setup
    starship
    zoxide
    grc
  ];

  programs.fish.enable = true;

  nix.settings.trusted-users = [ "root" "@wheel" ];

  # MariaDB
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
