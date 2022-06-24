{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fonts-junicode";
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
    fontdir=$out/lib/satysfi/dist/fonts/junicode

    mkdir -p $fontdir
    mkdir -p $out/lib/satysfi/dist/hash

    cp $fontsrc/Junicode-Bold.ttf $fontdir
    cp $fontsrc/Junicode-BoldItalic.ttf $fontdir
    cp $fontsrc/Junicode-Italic.ttf $fontdir
    cp $fontsrc/Junicode.ttf $fontdir
    cp $fontsrc/FoulisGreek.ttf $fontdir

    cp $(echo $src | tr ' ' '\n' | grep -E ".*-fonts.satysfi-hash") $out/lib/satysfi/dist/hash/fonts.satysfi-hash
  '';
}
