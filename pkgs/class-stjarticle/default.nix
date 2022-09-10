{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-class-stjarticle";
  version = "9381bee930818464e76cdc4622eb381a1aba164f";

  outdir = "class-stjarticle";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "puripuri2100";
      repo = "stjarticle";
      rev = version;
      sha256 = "sha256-95D2nKVMDbvwNyppPNTzXxf1p6FzGiyLd9o81gh1S8g=";
    };
  in [
    "${root}/stjarticle.satyh"
  ];
}
