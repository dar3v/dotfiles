{lib, ...}: {
  imports = [
    ./bluetooth.nix
    ./sound.nix
    ./greetd.nix
    ./sshd.nix
  ];
  # Enable dconf
  programs.dconf.enable = lib.mkDefault true;

  # Enable CUPS to print documents.
  services.printing.enable = lib.mkDefault true;

  # Enable (or disable) some of my service configurations
  sounds.configure = lib.mkDefault true;
  bluetooth.configure = lib.mkDefault true;
  tuigreet.configure = lib.mkDefault true;
  sshd.configure = lib.mkDefault false;
}
