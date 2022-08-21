(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "class-jlreq";
    version = "0.0.3";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "abenori";
        repo = "satysfi-class-jlreq";
        rev = version;
        sha256 = "sha256-uDKUgpjHIocqIcln1QCDvR6965+MQqzOtZMIV5djB2w=";
      };
    in [
      "${root}/jlreq.satyh"
      "${root}/base.satyh"
      "${root}/jlreq0.satyh"
      "${root}/footnote.satyh"
      "${root}/heading.satyh"
      "${root}/lib.satyh"
      "${root}/paragraph.satyh"
      "${root}/theorem.satyh"
      "${root}/proof.satyh"
      "${root}/toc.satyh"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
      pagenumber
      pagestyle
    ];
  }
)
