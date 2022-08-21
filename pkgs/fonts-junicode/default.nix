{pkgs, ...}: let
  version = "331911ba9102d7cc489549a576a60e33affacc76";
  root = pkgs.fetchFromGitHub {
    owner = "na4zagin3";
    repo = "SATySFi-fonts-junicode";
    rev = version;
    sha256 = "sha256-id4xQWsVpYjYxyVXQHhMMOWv0YqzvmJ+sYS2NrhTVi8=";
  };
in
  pkgs.stdenv.mkDerivation {
    inherit (version);
    name = "satyxin-package-fonts-junicode-${version}";
    outdir = "fonts-junicode";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-junicode
      cp -r ${pkgs.junicode}/share/fonts/junicode-ttf/* $out/fonts/fonts-junicode

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
    '';
  }
