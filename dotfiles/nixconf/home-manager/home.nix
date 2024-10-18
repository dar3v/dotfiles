{pkgs, ...}:
{
  imports = [
  ./fish.nix
  ./theme.nix
  ./lf.nix
  ./nvim.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dare";
  home.homeDirectory = "/home/dare";

  home.sessionVariables = {
   EDITOR = "nvim";
  };


  # The home.packages option allows you to install Nix packages into your
  # environment.

xdg.enable = true;
services.syncthing.enable = true;
nixpkgs.config.allowUnfree = true;

home.packages = with pkgs; [
  obsidian
  nemo
  kitty
  imv
  fzf
  stc-cli
  mpv
  mpd
  zathura
  poppler
  ani-cli
  nvtopPackages.full
  grim
  slurp
];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
#  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
#  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dare/etc/profile.d/hm-session-vars.sh

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
