{pkgs, ...}: let
  version = "f39000af35a8056cfddd82fb5787d5c87b2bbca0";
  root = pkgs.fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-noto-sans-cjk-jp";
    rev = version;
    sha256 = "sha256-5XM4Vs1MeFJy2dymxu4aq/krrD1dzSrHyzU3HmFM+3Q=";
  };
  fontfile = pkgs.fetchzip {
    url = "https://github.com/zeptometer/noto-cjk/releases/download/NotoSansV2.001/NotoSerifCJKJp.zip";
    sha256 = "sha256-Fyjbt7OP49Y2mEX3RKAyvi442Wq4Qsv8w7MIgV2/odQ=";
  };
in
  pkgs.stdenv.mkDerivation {
    inherit (version);
    name = "satyxin-psuedo-fonts-noto-sans-cjk-jp-${version}";

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
