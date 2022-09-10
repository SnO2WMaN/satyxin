{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-class-yabaitech";
  version = "0.0.9";

  outdir = "class-yabaitech";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "yabaitechtokyo";
      repo = "satysfi-class-yabaitech";
      rev = version;
      sha256 = "sha256-unDdYmmfHYIImbK2px6jAQrkXWuPF/Ksrnk5Qcw99dY=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    psuedo-fonts-noto-sans
    psuedo-fonts-noto-serif
    psuedo-fonts-noto-sans-cjk-jp
    psuedo-fonts-noto-serif-cjk-jp
    psuedo-fonts-asana-math
  ];
}
