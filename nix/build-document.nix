{pkgs}: let
  inherit (pkgs.lib) removeSuffix hasSuffix;
in
  {
    name,
    src,
    filename,
    output ? "${removeSuffix ".saty" filename}.pdf",
    buildInputs ? [],
  }:
    pkgs.stdenv.mkDerivation {
      inherit src name;
      buildPhase = ''
        satysfi ${
          if hasSuffix ".saty" filename
          then filename
          else builtins.abort "File name must have '.saty', but passed '${filename}'"
        } --output ${output} --config $SATYSFI_LIBPATH
      '';
      installPhase = ''
        mkdir -p $out/docs
        cp ${output} $out/docs/
      '';
      buildInputs = [pkgs.satysfi] ++ buildInputs;
    }
