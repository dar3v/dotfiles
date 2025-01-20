{pkgs, ...}: {
  stylix = {
    enable = true;

    # base16 color scheme that stylix will apply
    base16Scheme = {
      # kanagawa-dragon theme
      base00 = "1F1F28";
      base01 = "2A2A37";
      base02 = "223249";
      base03 = "727169";
      base04 = "C8C093";
      base05 = "DCD7BA";
      base06 = "938AA9";
      base07 = "363646";
      base08 = "C34043";
      base09 = "FFA066";
      base0A = "DCA561";
      base0B = "98BB6C";
      base0C = "7FB4CA";
      base0D = "7E9CD8";
      base0E = "957FB8";
      base0F = "D27E99";
    };

    # remove window border radius
    gtk = {
      enable = true;
      extraCss = ''
        window.background { border-radius: 0; }
      '';
    };

    # appply a monospace, sans-serif, and serif font
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBransMonoNF-Regular";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    # apply a cursor theme
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";

    # apply an icon theme
    iconTheme = {
      enable = true;
      package = pkgs.vimix-icon-theme;
    };

    # manually enable stylix on some programs
    river.enable = true;
    rofi.enable = true;
    yazi.enable = true;
  };
}
