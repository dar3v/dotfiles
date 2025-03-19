{lib, ...}: {
  imports = [
    ./services/bluetooth.nix
    ./services/sound.nix
    ./services/polkit.nix
    ./services/greetd.nix
    ./services/sshd.nix
  ];
  # Enable dconf
  programs.dconf.enable = lib.mkDefault true;

  # Enable CUPS to print documents.
  services.printing.enable = lib.mkDefault true;

  # Enable (or disable) some of my service configurations
  sounds.configure = lib.mkDefault true;
  bluetooth.configure = lib.mkDefault true;
  tuigreet.configure = lib.mkDefault true;
  polkit.configure = lib.mkDefault false;
  sshd.configure = lib.mkDefault false;
}
