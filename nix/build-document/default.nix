{pkgs}: let
  inherit (pkgs.lib) removeSuffix hasSuffix;
in
  {
    name,
    src,
    entrypoint,
    output ? "${removeSuffix ".saty" entrypoint}.pdf",
    satysfiDist,
  }:
    pkgs.stdenv.mkDerivation {
      inherit name src satysfiDist;

      buildInputs = with pkgs; [
        satysfi
        jq
        moreutils
      ];

      entrypoint =
        if hasSuffix ".saty" entrypoint
        then entrypoint
        else builtins.abort "File name must have '.saty', but passed '${entrypoint}'";

      output = output;

      buildPhase = ''
        satysfi_libpath=`mktemp -d`

        mkdir -p $satysfi_libpath/dist
        cp -r $satysfiDist/* $satysfi_libpath/dist

        satysfi $entrypoint --output $output --config $satysfi_libpath
      '';
      installPhase = ''
        mkdir -p $out/docs
        cp $output $out/docs/$output
      '';
    }
