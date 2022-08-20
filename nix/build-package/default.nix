{pkgs}: {
  name,
  src,
  sources ? {},
  deps ? [],
}: let
  inherit (import ../utils {inherit pkgs;}) merge-satysfi-hash;
in
  pkgs.stdenv.mkDerivation {
    inherit name src deps;
    sources = builtins.toJSON sources;

    dontBuild = true;

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

      for i in $(seq 0 $(($(echo $sources | jq ".files | length") - 1))); do
          mkdir -p $out/packages/$name/

          path=`echo $sources | jq -r ".files[$i]"`
          cp $src/$path $out/packages/$name/$path
      done

      for i in $(seq 0 $(($(echo $sources | jq ".dirs | length") - 1))); do
          mkdir -p $out/packages/$name/

          path=`echo $sources | jq -r ".dirs[$i]"`
          cp -r $src/$path/* $out/packages/$name
      done
    '';
    buildInputs = with pkgs; [
      jq
      moreutils
      merge-satysfi-hash
    ];
  }
