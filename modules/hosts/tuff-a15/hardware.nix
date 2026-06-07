{ self, inputs, ... }:
{
  flake.nixosModules."hosts.tuff-a15.hardware" =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "amdgpu" ];
      boot.extraModulePackages = [ ];

      # btrfs on a single nvme partition, three subvolumes
      fileSystems."/" = {
        device = "/dev/disk/by-uuid/339db0ee-f05c-43ea-b88b-c300046ca7a8";
        fsType = "btrfs";
        options = [ "subvol=@" ];
      };

      fileSystems."/home" = {
        device = "/dev/disk/by-uuid/339db0ee-f05c-43ea-b88b-c300046ca7a8";
        fsType = "btrfs";
        options = [ "subvol=@home" ];
      };

      fileSystems."/nix" = {
        device = "/dev/disk/by-uuid/339db0ee-f05c-43ea-b88b-c300046ca7a8";
        fsType = "btrfs";
        options = [ "subvol=@nix" ];
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/671D-3B4C";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
