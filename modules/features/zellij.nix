{self, ...}: {
  # zellij, terminal multiplexer
  # config files are linked to .config/zellij
  # from dotfiles/configs/
  flake.homeModules.zellij = {...}: {
    programs.zellij = {
      enable = true;
    };

    home.file.".config/zellij" = {
      source = self + "/config/zellij";
      recursive = true;
    };
  };
}
