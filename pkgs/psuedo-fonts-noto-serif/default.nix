{pkgs, ...}: let
  version = "d87cd4cc70545cf962585db63ec92b078a646b6a";
  root = pkgs.fetchFromGitHub {
    owner = "zeptometer";
    repo = "SATySFi-fonts-noto-serif";
    rev = version;
    sha256 = "sha256-lqkB8z1gh9gE8F6TgrBiMaXbgAwhewNLPbW1JwLfIpU=";
  };
  fontfile = pkgs.fetchzip {
    url = "https://github.com/zeptometer/noto-fonts/releases/download/v2.7-NotoSlimVF/NotoSerif.zip";
    sha256 = "sha256-6ikZvMj1H74+egQLOjnJ7WSexlPKIE3Xy5g6x2yl5pk=";
  };
in
  pkgs.stdenv.mkDerivation {
    inherit (version);
    name = "satyxin-package-psuedo-fonts-noto-serif-${version}";

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/fonts/fonts-noto-serif
      cp -r ${fontfile}/* $out/fonts/fonts-noto-serif

      mkdir -p $out/hash
      cp ${"${root}/fonts.satysfi-hash"} $out/hash/fonts.satysfi-hash
      # cp ${"${root}/mathfonts.satysfi-hash"} $out/hash/mathfonts.satysfi-hash
    '';
  }
