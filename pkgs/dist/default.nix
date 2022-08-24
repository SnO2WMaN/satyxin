{
  pkgs,
  stdenv,
  ...
}:
stdenv.mkDerivation {
  name = "satyxin-package-dist";

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    cp -r ${pkgs.satysfi}/share/satysfi/dist $out
  '';
}
