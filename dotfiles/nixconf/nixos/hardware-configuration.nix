{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/93A3-4CAC";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=root" "defaults" "lazytime" "noatime" "compress=zstd" "autodefrag" "nodiscard" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=home" "defaults" "lazytime" "noatime" "compress=zstd" "autodefrag" "nodiscard" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=nix" "defaults" "lazytime" "noatime" "compress=zstd" "autodefrag" "nodiscard" ];
    };

  fileSystems."/var/lib" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=var/lib" "defaults" "lazytime" "noatime" "compress=zstd" "autodefrag" "nodiscard" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=var/log" "defaults" "lazytime" "noatime" "compress=zstd" "autodefrag" "nodiscard" ];
    };

  fileSystems."/var/swap" =
    { device = "/dev/disk/by-uuid/b576fc06-c05b-49e4-8d21-4ae4b6f0f084";
      fsType = "btrfs";
      options = [ "subvol=var/swap" "noatime" ];
    };

  swapDevices = [ {device = "/var/swap/swapfile"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
