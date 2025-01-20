{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # code stuff
    nodejs
    python3
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
    fish
    starship
    zoxide
  ];

  # MariaDB
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
