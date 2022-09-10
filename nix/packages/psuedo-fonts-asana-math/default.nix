{
  pkgs,
  stdenv,
  fetchFromGitHub,
  fetchurl,
  ...
}: let
  version = "50f685d35897685da0b7462e7625ed23db1db8f0";
  root = fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-asana-math";
    rev = version;
    sha256 = "sha256-RBbHeki+1ND+kedYuSzEYQtP8qJcXSmQ5fLl7QUa2uU=";
  };
  fontfile = fetchurl {
    url = "http://mirrors.ctan.org/fonts/Asana-Math/Asana-Math.otf";
    sha256 = "b0d9e681c08ff1f4dc6ebf085cc962585ec12cdbd25dc6225890b9f8fd12d568";
  };
in
  stdenv.mkDerivation {
    inherit version;
    pname = "satyxin-psuedo-fonts-asana-math";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-asana-math
      cp -r ${fontfile} $out/fonts/fonts-asana-math/Asana-Math.otf

      mkdir -p $out/hash
      # cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
