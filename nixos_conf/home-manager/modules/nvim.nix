{ pkgs, ...}:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	
		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
		];
	
		extraPackages =	with pkgs;
		[
			lua-language-server
	
			nixd
			alejandra
		];
	};
	
	 home.packages = with pkgs;
	 [
	 	ripgrep
	 ];
}
