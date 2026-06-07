{ ... }:
{
  # helix editor with evil-helix
  flake.homeModules.helix =
    { pkgs, lib, ... }:
    {
      home.packages = with pkgs; [
        nixd
      ];

      programs.helix = {
        package = pkgs.evil-helix;
        enable = true;
        settings = {
          theme = "ashen";
        };
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = lib.getExe pkgs.nixfmt;
          }
        ];
      };
    };
}
