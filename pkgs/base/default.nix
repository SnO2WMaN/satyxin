(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "base";
    version = "1.4.0";
    sources = let
      root = fetchFromGitHub {
        owner = "nyuichi";
        repo = "satysfi-base";
        rev = version;
        sha256 = "sha256-KE75gamAeB+HVbA29eUv88FQQLglHDLWTT65E/EFgVo=";
      };
    in [
      "${root}/src"
    ];
    deps = with satyxinPackages; [
      zrbase
    ];
  }
)
