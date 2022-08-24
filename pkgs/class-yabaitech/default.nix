(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "class-yabaitechtokyo";
    version = "0.0.9";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "yabaitechtokyo";
        repo = "satysfi-class-yabaitech";
        rev = version;
        sha256 = "sha256-unDdYmmfHYIImbK2px6jAQrkXWuPF/Ksrnk5Qcw99dY=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      psuedo-fonts-noto-sans
      psuedo-fonts-noto-serif
      psuedo-fonts-noto-sans-cjk-jp
      psuedo-fonts-noto-serif-cjk-jp
      psuedo-fonts-asana-math
    ];
  }
)
