{
  description = "dar3v nixos config flake";

  # > inputs <
  inputs = {
    # enable nixos-unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # nixos-hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    # stylix
    stylix.url = "github:danth/stylix";

    # aagl
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # > outputs <
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    stylix,
    lanzaboote,
    aagl,
    ...
  } @ inputs: {
    # nix configuration
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/fa506ic/configuration.nix
        ./modules/default.nix
        nixos-hardware.nixosModules.asus-fa506ic #  NOTE: change accordingly to ur hardware
        lanzaboote.nixosModules.lanzaboote
      ];
    };

    # home-manager
    homeConfigurations.dar3v = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [
        ./home-manager/home.nix
        stylix.homeManagerModules.stylix
      ];
    };
  };
}
