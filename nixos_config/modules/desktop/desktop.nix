# desktop.nix
# general desktop configuration
# imports specific desktop use cases such as for `gaming` and `coding`
{lib, ...}: {
  imports = [
    ./secureboot.nix
    ./wm.nix
    ./gaming.nix
    ./dev.nix
  ];

  secure-boot.configure = lib.mkDefault false;
  gaming = lib.mkDefault false;
  wm.enable = lib.mkDefault true;
}
