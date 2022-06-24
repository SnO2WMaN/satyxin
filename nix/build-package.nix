{ pkgs }:
{ name, src, sources ? { }, deps ? [ ] }:
pkgs.stdenv.mkDerivation {
  inherit name src deps;
  sources = builtins.toJSON sources;

  phases = [ "installPhase" ];
  installPhase = ''
    for dep in $(echo $deps | tr ' ' '\n'); do
      ls $dep/lib/satysfi/dist

      if [ -d $dep/lib/satysfi/dist/fonts ]; then
        mkdir -p $out/lib/satysfi/dist/fonts
        cp -r $dep/lib/satysfi/dist/fonts $out/lib/satysfi/dist
      fi

      if [ -d $dep/lib/satysfi/dist/hash ]; then
        mkdir -p $out/lib/satysfi/dist/hash
        cp -r $dep/lib/satysfi/dist/hash $out/lib/satysfi/dist
      fi

      if [ -d $dep/lib/satysfi/dist/unidata ]; then
        mkdir -p $out/lib/satysfi/dist/unidata
        cp -r $dep/lib/satysfi/dist/unidata $out/lib/satysfi/unidata
      fi

      if [ -d $dep/lib/satysfi/dist/packages ]; then
        mkdir -p $out/lib/satysfi/dist/packages
        for file in $(find $dep/lib/satysfi/dist/packages -type f); do
          target=$out/$(realpath --relative-to=$dep $file)
          if [ ! -e $target ]; then # TODO: if exists, compare
            mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
            cp $file $target
          fi
        done
      fi
    done

    for i in $(seq 0 $(($(echo $sources | jq ".files | length") - 1))); do
        mkdir -p $out/lib/satysfi/dist/packages/$name/

        path=`echo $sources | jq -r ".files[$i]"`
        cp $src/$path $out/lib/satysfi/dist/packages/$name/$path
    done

    for i in $(seq 0 $(($(echo $sources | jq ".dirs | length") - 1))); do
        mkdir -p $out/lib/satysfi/dist/packages/$name/

        path=`echo $sources | jq -r ".dirs[$i]"`
        cp -r $src/$path/* $out/lib/satysfi/dist/packages/$name
    done
  '';
  setupHook = pkgs.writeText "setuphook-satysfi-package" ''
    SATYSFI_LIBPATH+=:$1/lib/satysfi
  '';
  buildInputs = with pkgs; [ jq ];
}
