{...}: {
  flake.homeModules.yazi = {
    pkgs,
    lib,
    ...
  }: let
    # fetch the whole ashen monorepo, scoped to just the yazi subdirectory.
    # pin the rev and update deliberately by bumping this.
    ashenFlavor =
      pkgs.fetchgit {
        url = "https://codeberg.org/ficd/ashen";
        rev = "2da901f3ce";
        hash = "sha256-d1k7w1cXvj73Ati+jLEaccR4pzvDNzVutlDRRGoONxE=";
        sparseCheckout = ["ashen.yazi"];
      }
      + "/ashen.yazi";
  in {
    home.packages = with pkgs; [
      ffmpegthumbnailer
      unar
      poppler-utils
      mediainfo
    ];

    programs.yazi = {
      enable = true;
      enableFishIntegration = true;

      flavors = {
        ashen = ashenFlavor;
      };

      plugins = with pkgs.yaziPlugins; {
        inherit smart-enter;
        inherit jump-to-char;
        inherit bypass;
        inherit git;
        inherit chmod;
        inherit compress;
        inherit full-border;
        inherit smart-filter;
      };

      initLua = ''
        require("full-border"):setup()
        require("git"):setup()
      '';

      settings = {
        theme = {
          flavor = {
            dark = "ashen";
            light = "ashen";
          };
        };

        manager = {
          show_hidden = false;
          sort_dir_first = true;
          sort_by = "natural";
          linemode = "git";
        };

        preview = {
          image_filter = "lanczos3";
          image_quality = 90;
          video_delay = 100;
        };
      };

      keymap.manager.prepend_keymap = [
        {
          on = ["l"];
          run = "plugin smart-enter";
          desc = "open or enter";
        }
        {
          on = ["f"];
          run = "plugin jump-to-char";
          desc = "jump to char";
        }
        {
          on = ["F"];
          run = "plugin smart-filter";
          desc = "smart filter";
        }
        {
          on = ["C"];
          run = "plugin compress";
          desc = "compress";
        }
        {
          on = ["="];
          run = "plugin chmod";
          desc = "chmod";
        }
        {
          on = ["<S-h>"];
          run = "tab_switch -1 --relative";
          desc = "prev tab";
        }
        {
          on = ["<S-l>"];
          run = "tab_switch 1 --relative";
          desc = "next tab";
        }
      ];
    };
  };
}
