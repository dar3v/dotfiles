{pkgs, ...}:
{
  imports =
    [
     ./hardware-configuration.nix
     ./laptop.nix
     ./packages.nix
     ./wm.nix
    ];

 nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

# users
  users.users.USER = {
    isNormalUser = true;
    description = "USER"; # TODO: rename USER to your username
        extraGroups = [ "networkmanager" "wheel" ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  time.timeZone = "Asia/Tokyo"; # set timezone
  i18n.defaultLocale = "en_US.UTF-8"; # set locale

# enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# environment variables
  environment.sessionVariables = {
      FLAKE = "/home/dare/Documents/nixconf/"; # nh helper needs this
    };

services.fstrim.enable = true;
services.flatpak.enable = true;
xdg.portal = {
      enable = true;
      configPackages =  [ pkgs.xdg-desktop-portal-gtk ];
      extraPortals =  [ pkgs.xdg-desktop-portal-wlr ];
    };

# networking
networking = {
networkmanager.enable = true;
    # dns
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    # firewall
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
      allowedUDPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 8000; to = 8010; }
      ];
  };
};

# bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

# configure keymap
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

# enable mousepad just in case
  services.libinput.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
        enable = true;
        extraConfig = {
            "10-disable-camera" = {
            "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
                  };
              };
          };
      };
  };

# bootloader
  boot.loader = {
   efi = {
     canTouchEfiVariables = true;
     efiSysMountPoint = "/boot/efi";
   };
   grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
   };
  };

system.stateVersion = "24.05";
}
