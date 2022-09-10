{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-fss";
  version = "0.2.0";

  outdir = "fss";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "na4zagin3";
      repo = "satysfi-fss";
      rev = "v${version}";
      sha256 = "sha256-9MLw4A5pF5f3KY5r7v+bDV9BAaPzKRh1Yi+dQi5QMPs=";
    };
  in [
    "${root}/src/fss"
  ];
  deps = with satyxinPackages; [
    base
    dist
    psuedo-fonts-junicode
  ];
}
