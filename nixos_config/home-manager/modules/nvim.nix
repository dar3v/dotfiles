{pkgs, ...}: {
  # my nvim config is on `lua`,
  # this is only for installing neovim itself and LSPs
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];

    extraPackages = with pkgs; [
      lua-language-server
      typescript-language-server

      nixd
      alejandra
    ];
  };
}
