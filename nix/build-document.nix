{pkgs}: {
  name,
  src,
  filename,
  buildInputs ? [],
}:
pkgs.stdenv.mkDerivation {
  inherit src name;
  buildPhase = ''
    satysfi ${filename} --output document.pdf --config $SATYSFI_LIBPATH
  '';
  installPhase = ''
    mkdir -p $out/docs
    cp document.pdf $out/docs/
  '';
  buildInputs = [pkgs.satysfi] ++ buildInputs;
}
