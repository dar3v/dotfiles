{ ... }:
{
  # general cli toolbox: shell utilities, pager, tui git client, and dev runtimes
  # also sets default editor and pager via session variables
  flake.homeModules.tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gitui # tui git client
        bat # syntax-highlighted cat
        btop # resource monitor
        tldr # short man pages
        grc # generic log colourer
        ov # feature-rich pager

        pnpm
        nodejs
        rustup
        uv # fast python package manager
      ];

      home.sessionVariables = {
        EDITOR = "hx";
        PAGER = "ov";
      };

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
    };
}
