{
  pkgs,
  stdenv,
  satysfi,
  ...
}:
stdenv.mkDerivation {
  name = "satyxin-package-dist";

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    cp -r ${satysfi}/share/satysfi/dist $out
  '';
}
