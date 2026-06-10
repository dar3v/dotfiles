{ self, inputs, ... }:
{
  flake.nixosConfigurations."tuff-a15" = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules = [ self.nixosModules."hosts.tuff-a15.system" ];
  };

  flake.nixosModules."hosts.tuff-a15.system" =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixos-hardware.nixosModules.asus-fa506ic

        self.nixosModules."hosts.tuff-a15.hardware"
        self.nixosModules.homeManager
        self.nixosModules.nixLd
        self.nixosModules.niri
        self.nixosModules.fish
      ];

      home-manager.users.dar3v = self.homeModules."users.dar3v.home";

      # --- nix daemon ---
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      nixpkgs.config.allowUnfree = true;

      # --- boot ---
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # --- kernel ---
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.kernelParams = [ "video=eDP-1:1920x1080@60" ];
      boot.loader.systemd-boot.consoleMode = "1"; # lower console resolution at boot

      # --- swap ---
      swapDevices = [ { device = "/var/swapfile"; } ];
      boot.kernel.sysctl."vm.swappiness" = 10;

      # --- btrfs mount options ---
      fileSystems = {
        "/".options = [
          "compress=zstd:3"
          "noatime"
        ];
        "/home".options = [ "compress=zstd:3" ];
        "/nix".options = [
          "compress=zstd:3"
          "noatime"
        ];
      };
      services.fstrim.enable = true;

      # --- display manager ---
      services.displayManager.ly.enable = true;

      # --- networking ---
      networking.hostName = "tuff-a15";
      networking.networkmanager.enable = true;
      hardware.bluetooth.enable = true;

      # --- power ---
      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

      # --- locale ---
      time.timeZone = "Asia/Manila";
      i18n.defaultLocale = "en_US.UTF-8";

      # --- services ---
      services.printing.enable = true;

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };

      # --- users ---
      users.users.dar3v = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };

      # minimal system-wide packages
      environment.systemPackages = with pkgs; [
        vim
        pavucontrol
        git
        fastfetch
        librewolf
        tree
      ];

      system.stateVersion = "26.11";
    };
}
