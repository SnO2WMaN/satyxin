{
  pkgs,
  stdenv,
  fetchzip,
  fetchFromGitHub,
  ...
}: let
  version = "882b8c4b894b4a487e5a566f8f6c2f10a5e3bd29";
  root = fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-noto-sans";
    rev = version;
    sha256 = "sha256-TF7wOJnbcX36MPpofZNgtKJ+rfz5qLgmoOfJFIANYy0=";
  };
  fontfile = fetchzip {
    url = "https://github.com/zeptometer/noto-fonts/releases/download/v2.7-NotoSlimVF/NotoSans.zip";
    sha256 = "sha256-s3+l96VZvzFz/p5p5i+qOBYJL1atR19PVABwoaEZR+c=";
  };
in
  stdenv.mkDerivation {
    inherit version;
    pname = "satyxin-psuedo-fonts-noto-sans";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-noto-sans
      cp -r ${fontfile}/* $out/fonts/fonts-noto-sans

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      # cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
