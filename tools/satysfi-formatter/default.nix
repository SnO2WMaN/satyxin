{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  locked,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-formatter";
  version = src.rev;

  src = fetchFromGitHub {
    inherit (locked) owner repo rev;
    sha256 = locked.narHash;
  };

  cargoSha256 = "sha256-xVfpKDKAhZUBB5MR3yFe28oyAkxp2du7xA10rBuZVJY=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/usagrada/satysfi-formatter";
    license = licenses.mit;
  };
}
