{ ... }:
{
  # yazi terminal file manager with fish shell integration
  flake.homeModules.yazi =
    { ... }:
    {
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
