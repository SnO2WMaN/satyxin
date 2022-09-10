{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-derive";
  version = "1.0.0";

  outdir = "derive";
  src = fetchFromGitHub {
    owner = "yabaitechtokyo";
    repo = "satysfi-derive";
    rev = version;
    sha256 = "sha256-E2Is9WDO/psnWEL1Nt43QkkSPZOL3uT0Xm54y1jZgfM=";
  };

  sources = let
    root = fetchFromGitHub {
      owner = "yabaitechtokyo";
      repo = "satysfi-derive";
      rev = version;
      sha256 = "sha256-E2Is9WDO/psnWEL1Nt43QkkSPZOL3uT0Xm54y1jZgfM=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
  ];
}
