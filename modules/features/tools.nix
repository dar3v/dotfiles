{ self, ... }:
{
  # general cli toolbox:
  # - shell utilities,
  # - terminal utilities,
  # - dev runtimes,
  # also sets some session variables
  # and links relevant config files to .config/
  flake.homeModules.tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gitui # tui git client
        bat # syntax-highlighted cat
        btop # resource monitor
        tldr # short man pages
        grc # generic log colourer
        kitty # terminal emulator

        pnpm
        nodejs
        rustup
        uv # fast python package manager
      ];

      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      programs.eza = {
        enable = true;
        enableFishIntegration = true;
        git = true;
        colors = "auto";
      };

      # link kitty configs
      home.file.".config/kitty" = {
        source = self + "/config/kitty";
        recursive = true;
      };
    };
}
