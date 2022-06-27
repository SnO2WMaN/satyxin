{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fonts-dejavu";
  src = [
    (pkgs.fetchzip {
      name = "dejavu";
      url = http://sourceforge.net/projects/dejavu/files/dejavu/2.37/dejavu-fonts-ttf-2.37.zip;
      sha256 = "sha256-eUV9CThmZLXMosUjvwvMwnWtZpgwFGZZws848kcOgE4=";
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
    mkdir -p $out/fonts/fonts-dejavu

    for file in $(find $(echo $src | tr ' ' '\n' | grep -E ".*-dejavu")/ttf -name "*.ttf"); do
        cp $file $out/fonts/fonts-dejavu
    done

    mkdir -p $out/hash
    cp $(echo $src | tr ' ' '\n' | grep -E "*-fonts.satysfi-hash") $out/hash/fonts.satysfi-hash
    cp $(echo $src | tr ' ' '\n' | grep -E "*-mathfonts.satysfi-hash") $out/hash/mathfonts.satysfi-hash
  '';
}
