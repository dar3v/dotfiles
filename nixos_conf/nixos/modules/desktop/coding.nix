{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # code stuff
    nodejs
    typescript
    python3
    gnumake

    # dotnet
    dotnet-sdk_9
    dotnet-runtime_9
    dotnet-aspnetcore_9

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
