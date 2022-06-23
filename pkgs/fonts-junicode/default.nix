{pkgs}:
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
    srcjuni=$(echo $src | tr ' ' '\n' | grep junicode)
    srchash=$(echo $src | tr ' ' '\n' | grep fonts.satysfi-hash)

    mkdir -p $out/lib/satysfi/dist/fonts/junicode
    mkdir -p $out/lib/satysfi/dist/hash

    cp $srcjuni/Junicode-Bold.ttf $out/lib/satysfi/dist/fonts/junicode
    cp $srcjuni/Junicode-BoldItalic.ttf $out/lib/satysfi/dist/fonts/junicode
    cp $srcjuni/Junicode-Italic.ttf $out/lib/satysfi/dist/fonts/junicode
    cp $srcjuni/Junicode.ttf $out/lib/satysfi/dist/fonts/junicode
    cp $srcjuni/FoulisGreek.ttf $out/lib/satysfi/dist/fonts/junicode

    cp $srchash $out/lib/satysfi/dist/hash/fonts.satysfi-hash
  '';
}
