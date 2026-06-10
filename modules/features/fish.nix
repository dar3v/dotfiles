{ ... }:
{
  # fish shell with tide prompt, grc colours, and noctalia shell integration
  flake.homeModules.fish =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting # disable greeting

          # name: 'Ashen'
          # url: 'https://sr.ht/~ficd/ashen'
          # preferred_background: 121212
          set -g fish_color_normal B4B4B4
          set -g fish_color_command C4693D -o
          set -g fish_color_param D5D5D5
          set -g fish_color_keyword B14242 -o
          set -g fish_color_quote DF6464
          set -g fish_color_redirection E49A44
          set -g fish_color_end E49A44
          set -g fish_color_comment 737373 -i
          set -g fish_color_error B14242
          set -g fish_color_gray 737373
          set -g fish_color_selection --background=322119
          set -g fish_color_search_match 121212 --background=322119
          set -g fish_color_option D87C4A
          set -g fish_color_operator C4693D
          set -g fish_color_escape D5D5D5
          set -g fish_color_autosuggestion 89492A
          set -g fish_color_cancel B14242
          set -g fish_color_cwd 4A8B8B
          set -g fish_color_user B14242
          set -g fish_color_host C4693D
          set -g fish_color_host_remote C4693D
          set -g fish_color_status D87C4A
          set -g fish_pager_color_progress D87C4A
          set -g fish_pager_color_prefix D87C4A
          set -g fish_pager_color_completion B4B4B4
          set -g fish_pager_color_description A7A7A7
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
  flake.nixosModules.fish = { ... }: {
    # i think i need this so that completions work properly
    programs.fish.enable = true;
  };
}
