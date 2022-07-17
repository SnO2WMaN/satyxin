{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  locked,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-language-server";
  version = src.rev;

  src = fetchFromGitHub {
    inherit (locked) owner repo rev;
    sha256 = locked.narHash;
  };

  cargoSha256 = "sha256-OJFdVTHq9eoXBVfm+XQKl3uEcv8bXFEw/7CQQhv/YlE=";

  meta = with lib; {
    homepage = "https://github.com/monaqa/satysfi-language-server";
    license = licenses.mit;
  };
}
