{ self, inputs, ... }:
{
  # standalone home-manager config for non-nixos machines, use with: home-manager switch --flake .#dar3v
  flake.homeConfigurations."dar3v" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules."users.dar3v.home"
      {
        home.username = "dar3v";
        home.homeDirectory = "/home/dar3v";
      }
    ];
  };

  # the actual home module imported both by the standalone config above
  # and by the nixos system in system.nix via home-manager.users
  # to add or remove features, edit the imports list here
  flake.homeModules."users.dar3v.home" =
    { ... }:
    {
      imports = [
        self.homeModules.helix
        self.homeModules.zed
        self.homeModules.fish
        self.homeModules.yazi
        self.homeModules.tools
        self.homeModules.zenBrowser
      ];

      home.stateVersion = "26.11";
    };
}
