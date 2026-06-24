{
  self,
  inputs,
  ...
}: {
  # niri wayland compositor, gui app bundle, xdg portal config, and font stack
  flake.nixosModules.niri = {pkgs, ...}: {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support for niri
      mpv
      imv
      zathura
      readest
      transmission_4-gtk
      ungoogled-chromium
    ];

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-wlr
      ];
      config = {
        common = {
          default = [
            "wlr"
            "gtk"
          ];
        };
        niri = {
          "org.freedesktop.impl.portal.FileChooser" = [
            "gnome"
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
          "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
        };
      };
    };

    fonts.packages = with pkgs; [
      inter
      roboto
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.commit-mono
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

  # separate homeModule
  # enables noctalia and links niri config.kdl
  flake.homeModules.niri = {...}: {
    imports = [inputs.noctalia.homeModules.default];
    programs.noctalia.enable = true;

    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
      };
    };

    programs.vesktop.enable = true;

    # home.file.".config/niri/config.kdl".source = self + "/config/niri/config.kdl";
  };
}
