{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;

    # base16 color scheme that stylix will apply
    base16Scheme = { # kanagawa-dragon theme
      base00 = "181616";
      base01 = "0d0c0c";
      base02 = "2d4f67";
      base03 = "a6a69c";
      base04 = "7fb4ca";
      base05 = "c5c9c5";
      base06 = "938aa9";
      base07 = "c5c9c5";
      base08 = "c4746e";
      base09 = "e46876";
      base0A = "c4b28a";
      base0B = "8a9a7b";
      base0C = "8ea4a2";
      base0D = "8ba4b0";
      base0E = "a292a3";
      base0F = "7aa89f";
    };

    # force dark mode
    polarity = "dark";

    # remove window border radius
    targets.gtk = {
      enable = true;

      # I HATE ROUNDED CORNERS
      extraCss = ''
        * { border-radius: 0; }
      '';
    };

    # use monospace for everything
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font";
      };
      sansSerif = config.stylix.fonts.monospace;
      serif = config.stylix.fonts.monospace;
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    # font sizes
    fonts.sizes = {
      applications = 10;
      desktop = 10;
      popups = 10;
    };

    # apply a cursor theme
    cursor = {
      package = pkgs.openzone-cursors;
      name = "Openzone Black";
      size = 32;
    };

    # apply an icon theme
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };

    # manually override stuff
    targets = {
      neovim.enable = false;
      kitty.enable = false;
      rofi.enable = false;
      waybar.enable = false;
      fish.enable = false;
    };
  };
}
