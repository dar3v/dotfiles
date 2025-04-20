{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # dev stuff
    devenv
    gnumake

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
}
