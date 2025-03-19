# desktop.nix
# general desktop configuration
# imports specific desktop use cases such as for `gaming` and `coding`
{lib, ...}: {
  imports = [
    ./desktop/secureboot.nix
    ./desktop/wm.nix
    ./desktop/gaming.nix
    ./desktop/coding.nix
  ];

  secure-boot.configure = lib.mkDefault false;
  gaming = lib.mkDefault false;
  wm.enable = lib.mkDefault true;
}
