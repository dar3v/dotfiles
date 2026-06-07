{ ... }:
{
  # niri wayland compositor, gui app bundle, xdg portal config, and font stack
  flake.nixosModules.niri =
    { pkgs, ... }:
    {
      programs.niri.enable = true;

      environment.systemPackages = with pkgs; [
        xwayland-satellite # xwayland support for niri
        kitty
        mpv
        imv
        transmission_4-gtk
        ungoogled-chromium
        vesktop
      ];

      xdg.portal.config.niri = {
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };

      fonts.packages = with pkgs; [
        inter
        roboto
        liberation_ttf
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
      ];

      fonts.fontconfig.defaultFonts = {
        serif = [
          "Noto Serif"
          "Liberation Serif"
        ];
        sansSerif = [
          "Inter"
          "Noto Sans"
        ];
        monospace = [
          "JetBrains Mono"
          "Fira Code"
        ];
      };
    };
}
