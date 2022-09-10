{
  pkgs,
  stdenv,
  fetchFromGitHub,
  dejavu_fonts,
  ...
}: let
  version = "20ebafa93bac3cce5c13934fe0600a4c50f0cd75";
  root = fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-dejavu";
    rev = version;
    sha256 = "sha256-y2tigU06C8fs8s+ImxMPUcdQwdj9mGzyRHNdC+TNR+4=";
  };
in
  stdenv.mkDerivation {
    inherit version;
    pname = "satyxin-psuedo-fonts-dejavu";
    outdir = "fonts-dejavu";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-dejavu
      cp -r ${dejavu_fonts}/share/fonts/truetype/* $out/fonts/fonts-dejavu

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
