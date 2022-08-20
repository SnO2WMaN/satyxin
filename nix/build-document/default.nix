{pkgs}: let
  inherit (pkgs.lib) removeSuffix hasSuffix;
in
  {
    name,
    src,
    entrypoint,
    output ? "${removeSuffix ".saty" entrypoint}.pdf",
    satysfiDist,
    satysfiLocal ? null,
    satysfi ? pkgs.satysfi,
  }:
    pkgs.stdenv.mkDerivation {
      inherit
        name
        src
        satysfiDist
        satysfiLocal
        ;

      buildInputs =
        (with pkgs; [jq moreutils])
        ++ [satysfi];

      entrypoint =
        if hasSuffix ".saty" entrypoint
        then entrypoint
        else builtins.abort "File name must have '.saty', but passed '${entrypoint}'";

      output = output;

      buildPhase = ''
        satysfi_libpath=`mktemp -d`
        test -e $satysfiLocal ; echo $?

        mkdir -p $satysfi_libpath/dist
        cp -r $satysfiDist/* $satysfi_libpath/dist

        if [ -e "$satysfiLocal" ]; then
          mkdir -p $satysfi_libpath/local
          cp -r $satysfiLocal/* $satysfi_libpath/local
        fi

        satysfi $entrypoint --output $output --config $satysfi_libpath
      '';
      installPhase = ''
        mkdir -p $out
        cp $output $out/$output
      '';
    }
