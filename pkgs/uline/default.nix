(import ../create-pkg.nix)
(
  {pkgs, ...}: rec {
    name = "uline";
    version = "0.2.2";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "puripuri2100";
        repo = "SATySFi-uline";
        rev = "v${version}";
        sha256 = "sha256-94lChvMIkuIFHJgPoMbQCkivIGwz5EieCOKpcTaKThc=";
      };
    in [
      "${root}/uline.satyh"
    ];
  }
)
