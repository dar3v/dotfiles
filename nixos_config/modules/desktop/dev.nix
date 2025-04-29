{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # dev stuff
    devenv
    gnumake
    universal-android-debloater

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

  # adb
  programs.adb.enable = true;
  users.users.dar3v.extraGroups = [ "adbusers" ];

  nix.settings.trusted-users = [ "root" "@wheel" ];
}
