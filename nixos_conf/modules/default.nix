{...}: {
  imports = [
    ./desktop/desktop.nix
    ./services/services.nix
  ];

  # nix settings
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
