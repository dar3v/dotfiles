{ config, pkgs, ...}:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;

		plugins = [
			pkgs.vimPlugins.nvim-treesitter.withAllGrammars
		];
	};
}
