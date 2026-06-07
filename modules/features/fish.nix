{ inputs, ... }:
{
  # fish shell with tide prompt, grc colours, and noctalia shell integration
  flake.homeModules.fish =
    { pkgs, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia.enable = true;

      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting # disable greeting
        '';
        generateCompletions = true;
        plugins = [
          {
            name = "tide";
            src = pkgs.fishPlugins.tide.src;
          }
          {
            name = "grc";
            src = pkgs.fishPlugins.grc.src;
          }
        ];
      };
    };
}
