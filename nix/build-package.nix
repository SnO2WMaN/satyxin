{ pkgs }:
{ name, src, sources ? { }, deps ? [ ] }:
pkgs.stdenv.mkDerivation {
  inherit name src deps;
  sources = builtins.toJSON sources;
  installPhase = ''
    mkdir -p $out/lib/satysfi/dist/{fonts,hash,packages}
    mkdir -p $out/lib/satysfi/dist/packages/$name/

    for dep in $(echo $deps | tr ' ' '\n'); do
      if [ -d $dep/lib/satysfi/dist/packages ]; then
        mkdir -p $out/lib/satysfi/dist/packages
        cp -r $dep/lib/satysfi/dist/packages/* $out/lib/satysfi/dist/packages
      fi
    done

    for i in $(seq 0 $(($(echo $sources | jq ".files | length") - 1))); do
        path=`echo $sources | jq -r ".files[$i]"`
        cp $src/$path $out/lib/satysfi/dist/packages/$name/$path
    done

    for i in $(seq 0 $(($(echo $sources | jq ".dirs | length") - 1))); do
        path=`echo $sources | jq -r ".dirs[$i]"`
        cp -r $src/$path/* $out/lib/satysfi/dist/packages/$name
    done
  '';
  setupHook = pkgs.writeText "setuphook-satysfi-package" ''
    SATYSFI_LIBPATH+=:$1/lib/satysfi
  '';
  buildInputs = with pkgs; [ jq ];
}
