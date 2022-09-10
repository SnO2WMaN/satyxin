{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../build-package {}
rec {
  pname = "satyxin-class-jlreq";
  version = "0.0.3";

  outdir = "class-jlreq";
  copyfrom = let
    root = fetchFromGitHub {
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
  deps = with satyxinPackages; [
    base
    dist
    pagenumber
    pagestyle
  ];
}
