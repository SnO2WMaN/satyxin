{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-figbox";
  version = "0.1.4";

  outdir = "figbox";
  sources = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "satysfi-figbox";
      rev = "v${version}";
      sha256 = "sha256-2S0Mwh90QqxcMI/iG28VPS3xW39zJmibDQ3QeeDGUvc=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    dist
  ];
}
