{
  pkgs,
  stdenv,
  fetchFromGitHub,
  junicode,
  ...
}: let
  version = "331911ba9102d7cc489549a576a60e33affacc76";
  root = fetchFromGitHub {
    owner = "na4zagin3";
    repo = "SATySFi-fonts-junicode";
    rev = version;
    sha256 = "sha256-id4xQWsVpYjYxyVXQHhMMOWv0YqzvmJ+sYS2NrhTVi8=";
  };
in
  stdenv.mkDerivation {
    inherit (version);
    name = "satyxin-package-psuedo-fonts-junicode-${version}";
    outdir = "fonts-junicode";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-junicode
      cp -r ${junicode}/share/fonts/junicode-ttf/* $out/fonts/fonts-junicode

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
    '';
  }
