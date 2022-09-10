{
  pkgs,
  stdenv,
  satysfi,
  ...
}:
stdenv.mkDerivation {
  pname = "satyxin-dist";
  version = satysfi.version;

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    cp -r ${satysfi}/share/satysfi/dist $out
  '';
}
