# desktop.nix
# general desktop configuration
# imports specific desktop use cases such as for `gaming` and `coding`
{lib, ...}: {
  imports = [
    ./secureboot.nix
    ./wm.nix
    ./gaming.nix
    ./dev.nix
    ./unity3d.nix
  ];

  secure-boot.configure = lib.mkDefault false;
  gaming = lib.mkDefault false;
  wm.enable = lib.mkDefault true;

  # auto-cpufreq
  programs.auto-cpufreq.enable = true;
}
