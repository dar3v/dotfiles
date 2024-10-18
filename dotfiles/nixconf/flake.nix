{
  description = "my Nixos config flake";

  inputs = {
    # enable nixos-unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager
     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
	};
    # auto-cpufreq
     auto-cpufreq = {
        url = "github:AdnanHodzic/auto-cpufreq";
        inputs.nixpkgs.follows = "nixpkgs";
    	};
  };

  outputs = { self, nixpkgs, home-manager, auto-cpufreq, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./nixos/configuration.nix
        auto-cpufreq.nixosModules.default
      ];
    };

      homeConfigurations."dare" = home-manager.lib.homeManagerConfiguration {
         pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
	 ./home-manager/home.nix 
	];
      };
  };
}
