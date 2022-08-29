(import ../create-pkg.nix)
(
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "uline";
    version = "0.2.2";
    sources = let
      root = fetchFromGitHub {
        owner = "puripuri2100";
        repo = "SATySFi-uline";
        rev = version;
        sha256 = "sha256-94lChvMIkuIFHJgPoMbQCkivIGwz5EieCOKpcTaKThc=";
      };
    in [
      "${root}/uline.satyh"
    ];
  }
)
