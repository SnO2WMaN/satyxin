{pkgs}: {
  packages ? [],
  adhocPackages ? [],
}: let
  inherit (import ../utils {inherit pkgs;}) merge-satysfi-hash;
in
  pkgs.stdenv.mkDerivation {
    name = "satydist";
    packages = builtins.toJSON (
      (map (name: pkgs.satyxinPackages."${name}") packages)
      ++ adhocPackages
    );

    dontUnpack = true;

    dontBuild = true;
    buildInputs = with pkgs; [
      jq
      moreutils
      merge-satysfi-hash
    ];

    installPhase = ''
      for i in $(seq 0 $(($(echo $packages | jq "length") - 1))); do
        package=`echo $packages | jq -r ".[$i]"`

        # fonts
        for file in $(find $package/fonts -type f); do
          target=$out/$(realpath --relative-to=$package $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$package $file))
            cp $file $target
          fi
        done

        # default-font.satysfi-hash
        if [ -e $package/hash/default-font.satysfi-hash ] && [ ! -e $out/hash/default-fonts.satysfi-hash ]; then
          mkdir -p $out/hash
          cat $package/hash/default-font.satysfi-hash > $out/hash/default-font.satysfi-hash
        fi

        # fonts.satysfi-hash
        if [ -e $package/hash/fonts.satysfi-hash ]; then
          mkdir -p $out/hash
          target=$out/hash/fonts.satysfi-hash
          [[ ! -e $target ]] && touch $target
          merge-satysfi-hash $package/hash/fonts.satysfi-hash $target | sponge $target
        fi

        # mathfonts.satysfi-hash
        if [ -e $package/hash/mathfonts.satysfi-hash ]; then
          mkdir -p $out/hash
          target=$out/hash/mathfonts.satysfi-hash
          [[ ! -e $target ]] && touch $target
          merge-satysfi-hash $package/hash/mathfonts.satysfi-hash $target | sponge $target
        fi

        # packages
        for file in $(find $package/packages -type f); do
          target=$out/$(realpath --relative-to=$package $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$package $file))
            cp $file $target
          fi
        done

        # unidata
        for file in $(find $package/unidata -type f); do
          target=$out/$(realpath --relative-to=$package $file)
          if [ ! -e $target ]; then
            mkdir -p $out/$(dirname $(realpath --relative-to=$package $file))
            cp $file $target
          fi
        done
      done
    '';
  }
