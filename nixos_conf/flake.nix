{
  description = "dar3v nixos config flake";

  # > inputs <
  inputs = {
      # enable nixos-unstable
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

      # nixos-hardware
      nixos-hardware.url = "github:NixOS/nixos-hardware/master";

      # home-manager
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      # auto-cpufreq
      auto-cpufreq = {
        url = "github:AdnanHodzic/auto-cpufreq";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      # aagl
      aagl = {
        url = "github:ezKEa/aagl-gtk-on-nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  # > outputs <
  outputs = { self,
              nixpkgs,
              home-manager,
              nixos-hardware,
              auto-cpufreq,
              aagl,
              }: 
	{
      # nix configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules =
          [
              ./nixos/configuration.nix

              # NOTE: change accordingly to ur hardware
              nixos-hardware.nixosModules.asus-fa506ic
              auto-cpufreq.nixosModules.default
              aagl.nixosModules.default
          ];
      };

      # home-manager
      homeConfigurations.dar3v = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [ ./home-manager/home.nix ];
	};
  };
}
