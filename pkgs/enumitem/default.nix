{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-enumitem";
  version = "3.0.1";

  outdir = "enumitem";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "satysfi-enumitem";
      rev = "v${version}";
      sha256 = "sha256-daCBZg9ekY1/o+ey4hKjnrtlxrRYXKOb5huxf+0CsS0=";
    };
  in [
    "${root}/src"
  ];

  deps = with satyxinPackages; [
    base
  ];
}
