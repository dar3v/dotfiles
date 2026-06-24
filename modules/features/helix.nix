{...}: {
  # helix editor with evil-helix
  flake.homeModules.helix = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = with pkgs; [
      nixd
    ];

    programs.helix = {
      enable = true;
      defaultEditor = true;
      package = pkgs.evil-helix;
      settings = {
        theme = "ashen";
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.alejandra;
        }
      ];
    };
  };
}
