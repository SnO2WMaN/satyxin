{
  pkgs,
  inputs,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  name = "satyxin-package-fonts-junicode-${version}";
  version = inputs.pkg-satysfi-fonts-junicode.rev;
  outdir = "fonts-junicode";
  src = [
    (pkgs.fetchzip {
      name = "junicode";
      url = http://downloads.sourceforge.net/project/junicode/junicode/junicode-1.002/junicode-1.002.zip;
      sha256 = "sha256-1q+fNdPjUJyuO6obWfstfCN9cuM/0mcB3LF9LVifBtk=";
      stripRoot = false;
    })
    ./fonts.satysfi-hash
  ];
  unpackPhase = ''
    for srcFile in $src; do
      cp -r $srcFile $(echo $srcFile | cut --delimiter=- --fields=2-)
    done
  '';
  installPhase = ''
    fontsrc=$(echo $src | tr ' ' '\n' | grep junicode)
    fontdir=$out/fonts/fonts-junicode

    mkdir -p $fontdir
    mkdir -p $out/hash

    cp $fontsrc/Junicode-Bold.ttf $fontdir
    cp $fontsrc/Junicode-BoldItalic.ttf $fontdir
    cp $fontsrc/Junicode-Italic.ttf $fontdir
    cp $fontsrc/Junicode.ttf $fontdir
    cp $fontsrc/FoulisGreek.ttf $fontdir

    cp $(echo $src | tr ' ' '\n' | grep -E ".*-fonts.satysfi-hash") $out/hash/fonts.satysfi-hash
  '';
}
