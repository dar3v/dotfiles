{pkgs, ...}:
{
  programs.neovim = {
      enable = true;
     extraPackages = with pkgs; [
        nil
        lua-language-server
        stylua
      ];
    };
home.packages = with pkgs; [
    omnisharp-roslyn
    dotnet-sdk
  ];
}
