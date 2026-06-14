{ ... }: {
  flake.nixosModules.docker = { ... }: {
    virtualisation.docker = {
      enable = true;
      daemon.settings = {
        experimental = true;
        features.cdi = true;
        default-address-pools = [
          {
            base = "172.30.0.0/16";
            size = 24;
          }
        ];
      };
    };
  };
}
