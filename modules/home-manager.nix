{ self, inputs, ... }:
{
  # wires home-manager into nixos and sets the options every host will want
  flake.nixosModules.homeManager =
    { ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.default
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
}
