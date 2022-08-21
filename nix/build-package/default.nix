{pkgs, ...}: {
  name,
  version,
  outdir,
  sources ? {},
  deps ? [],
}:
pkgs.stdenv.mkDerivation {
  inherit deps outdir;
  name = "satyxin-package-${name}-${version}";
  sources = builtins.toJSON sources;

  dontBuild = true;
  dontUnpack = true;

  nativeBuildInputs = with pkgs; [
    jq
    moreutils
    satyxin.mergeSatysfiHash
  ];
  installPhase = ''
    for dep in $(echo $deps | tr ' ' '\n'); do
      if [ -e $dep/hash/default-font.satysfi-hash ] && [ ! -e $out/hash/default-font.satysfi-hash ]; then
        mkdir -p $out/hash
        cat $dep/hash/default-font.satysfi-hash > $out/hash/default-font.satysfi-hash
      fi

      if [ -e $dep/hash/fonts.satysfi-hash ]; then
        mkdir -p $out/hash
        target=$out/hash/fonts.satysfi-hash
        [[ ! -e $target ]] && touch $target
        merge-satysfi-hash $dep/hash/fonts.satysfi-hash $target | sponge $target
      fi

      if [ -e $dep/hash/mathfonts.satysfi-hash ]; then
        mkdir -p $out/hash
        target=$out/hash/mathfonts.satysfi-hash
        [[ ! -e $target ]] && touch $target
        merge-satysfi-hash $dep/hash/mathfonts.satysfi-hash $target | sponge $target
      fi

      if [ -d $dep/fonts ]; then
        mkdir -p $out/fonts
        for file in $(find $dep/fonts -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi

      if [ -d $dep/unidata ]; then
        mkdir -p $out/unidata
        for file in $(find $dep/unidata -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi

      if [ -d $dep/packages ]; then
        mkdir -p $out/packages
        for file in $(find $dep/packages -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then # TODO: if exists, compare
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi

      if [ -d $dep/hyph ]; then
        mkdir -p $out/hyph
        for file in $(find $dep/hyph -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi

      if [ -d $dep/md ]; then
        mkdir -p $out/md
        for file in $(find $dep/md -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi
    done

    mkdir -p $out/packages/$outdir
    echo $sources
    for source in $(echo $sources | jq -r ".[]"); do
        if [ -d "$source" ]; then
          cp -r $source/* $out/packages/$outdir
        else
          cp $source $out/packages/$outdir
        fi
    done
  '';
}
