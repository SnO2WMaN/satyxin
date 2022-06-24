{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fonts-dejavu";
  src = [
    (pkgs.fetchzip {
      name = "dejavu";
      url = http://sourceforge.net/projects/dejavu/files/dejavu/2.37/dejavu-fonts-ttf-2.37.zip;
      sha256 = "sha256-JM75TClUBnQ7qKMHXbOD96ZoTxOhBFnsN5xH0QSafjc=";
    })
    ./fonts.satysfi-hash
    ./mathfonts.satysfi-hash
  ];
  unpackPhase = ''
    for srcFile in $src; do
      cp -r $srcFile $(echo $srcFile | cut --delimiter=- --fields=2-)
    done
  '';
  installPhase = ''
    fontsrc=$(echo $src | tr ' ' '\n' | grep dejavu)/dejavu-fonts-ttf-2.37/ttf
    fontdir=$out/lib/satysfi/dist/fonts/dejavu

    mkdir -p $fontdir
    mkdir -p $out/lib/satysfi/dist/hash

    cp $fontsrc/DejaVuMathTeXGyre.ttf $fontdir
    cp $fontsrc/DejaVuSans-Bold.ttf $fontdir
    cp $fontsrc/DejaVuSans-BoldOblique.ttf $fontdir
    cp $fontsrc/DejaVuSans-ExtraLight.ttf $fontdir
    cp $fontsrc/DejaVuSans-Oblique.ttf $fontdir
    cp $fontsrc/DejaVuSans.ttf $fontdir
    cp $fontsrc/DejaVuSansCondensed-Bold.ttf $fontdir
    cp $fontsrc/DejaVuSansCondensed-BoldOblique.ttf $fontdir
    cp $fontsrc/DejaVuSansCondensed-Oblique.ttf $fontdir
    cp $fontsrc/DejaVuSansCondensed.ttf $fontdir
    cp $fontsrc/DejaVuSansMono-Bold.ttf $fontdir
    cp $fontsrc/DejaVuSansMono-BoldOblique.ttf $fontdir
    cp $fontsrc/DejaVuSansMono-Oblique.ttf $fontdir
    cp $fontsrc/DejaVuSansMono.ttf $fontdir
    cp $fontsrc/DejaVuSerif-Bold.ttf $fontdir
    cp $fontsrc/DejaVuSerif-BoldItalic.ttf $fontdir
    cp $fontsrc/DejaVuSerif-Italic.ttf $fontdir
    cp $fontsrc/DejaVuSerif.ttf $fontdir
    cp $fontsrc/DejaVuSerifCondensed-Bold.ttf $fontdir
    cp $fontsrc/DejaVuSerifCondensed-BoldItalic.ttf $fontdir
    cp $fontsrc/DejaVuSerifCondensed-Italic.ttf $fontdir
    cp $fontsrc/DejaVuSerifCondensed.ttf $fontdir

    cp $(echo $src | tr ' ' '\n' | grep -E "*-fonts.satysfi-hash") $out/lib/satysfi/dist/hash/fonts.satysfi-hash
    cp $(echo $src | tr ' ' '\n' | grep -E "*-mathfonts.satysfi-hash") $out/lib/satysfi/dist/hash/mathfonts.satysfi-hash
  '';
}
