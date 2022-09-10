{
  pkgs,
  stdenv,
  fetchzip,
  fetchFromGitHub,
  ...
}: let
  version = "f39000af35a8056cfddd82fb5787d5c87b2bbca0";
  root = fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-noto-sans-cjk-jp";
    rev = version;
    sha256 = "sha256-5XM4Vs1MeFJy2dymxu4aq/krrD1dzSrHyzU3HmFM+3Q=";
  };
  fontfile = fetchzip {
    url = "https://github.com/zeptometer/noto-cjk/releases/download/NotoSansV2.001/NotoSansCJKJp.zip";
    sha256 = "sha256-Ho9BvInst2U4Mf/szyg6ISZUbXA5qypK11sPjedLhUs=";
  };
in
  stdenv.mkDerivation {
    inherit version;
    pname = "satyxin-pseudo-fonts-noto-sans-cjk-jp";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-noto-sans-cjk-jp
      cp -r ${fontfile}/* $out/fonts/fonts-noto-sans-cjk-jp

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      # cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
