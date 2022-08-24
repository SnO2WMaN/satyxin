(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "derive";
    version = "1.0.0";
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
)
