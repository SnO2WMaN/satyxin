{
  pkgs,
  stdenv,
  fetchzip,
  fetchFromGitHub,
  ...
}: let
  version = "3358a944ece3efaa33663ee0808c9f813a7a96c2";
  root = fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-noto-serif-cjk-jp";
    rev = version;
    sha256 = "sha256-4FdDAxvwukEycSuCyn7Ga3ImkOxRObUFT2B/ubrsxTE=";
  };
  fontfile = fetchzip {
    url = "https://github.com/zeptometer/noto-cjk/releases/download/NotoSansV2.001/NotoSerifCJKJp.zip";
    sha256 = "sha256-Fyjbt7OP49Y2mEX3RKAyvi442Wq4Qsv8w7MIgV2/odQ=";
  };
in
  stdenv.mkDerivation {
    inherit version;
    pname = "satyxin-pseudo-fonts-noto-serif-cjk-jp";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-noto-serif-cjk-jp
      cp -r ${fontfile}/* $out/fonts/fonts-noto-serif-cjk-jp

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      # cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
