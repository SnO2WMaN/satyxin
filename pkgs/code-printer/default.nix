{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-code-printer";
  version = "1.1.1";

  outdir = "code-printer";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "puripuri2100";
      repo = "satysfi-code-printer";
      rev = version;
      sha256 = "sha256-QyA8XJKgZDQUEMyDfFJiDra9jYZ5+E3gYSdNTmTEYGw=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    psuedo-fonts-dejavu
  ];
}
