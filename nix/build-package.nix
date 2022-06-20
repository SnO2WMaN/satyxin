{ pkgs }:
{ name, src, path }:
pkgs.stdenv.mkDerivation {
  inherit src name;
  installPhase = ''
    mkdir -p $out/lib/satysfi/dist/packages/$name/
    cp $src/${path} $out/lib/satysfi/dist/packages/$name/
  '';
  setupHook = pkgs.writeText "setuphook-satysfi-package" ''
    SATYSFI_LIBPATH+=:$1/lib/satysfi
  '';
}
