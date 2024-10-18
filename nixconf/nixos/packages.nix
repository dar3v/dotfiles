{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   # cli utils
   vim
   htop
   git
   fastfetch

   # code stuff
   python3
   nodejs
   gnumake
   unzip
   gcc
   cargo

   # etc
   home-manager
   nh
   nvd
  ];

fonts.packages = with pkgs; [
   jetbrains-mono
   noto-fonts
   noto-fonts-cjk
   noto-fonts-emoji
   google-fonts
   nerdfonts
 ];
}
