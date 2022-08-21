(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "derive";
    version = "1.0.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "yabaitechtokyo";
        repo = "satysfi-derive";
        rev = version;
        sha256 = "sha256-E2Is9WDO/psnWEL1Nt43QkkSPZOL3uT0Xm54y1jZgfM=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
