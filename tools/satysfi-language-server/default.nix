{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-language-server";
  version = src.rev;

  src = let
    locked = (builtins.fromJSON (builtins.readFile ../../flake.lock)).nodes.satysfi-language-server.locked;
  in
    fetchFromGitHub {
      inherit (locked) owner repo rev;
      sha256 = locked.narHash;
    };

  cargoSha256 = "sha256-OJFdVTHq9eoXBVfm+XQKl3uEcv8bXFEw/7CQQhv/YlE=";

  meta = with lib; {
    homepage = "https://github.com/monaqa/satysfi-language-server";
    license = licenses.mit;
  };
}
