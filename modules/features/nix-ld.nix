{ ... }:
{
  # nix-ld shim so pre-built elf binaries run without manual patchelf
  # ships a set of common libs that unpatched binaries usually expect
  flake.nixosModules.nixLd =
    { pkgs, ... }:
    {
      programs.nix-ld.enable = true;

      programs.nix-ld.libraries = with pkgs; [
        zlib
        zstd
        stdenv.cc.cc
        curl
        openssl
        attr
        libssh
        bzip2
        libxml2
        acl
        libsodium
        util-linux
        xz
        systemd
        glib
        gtk2
      ];
    };
}
