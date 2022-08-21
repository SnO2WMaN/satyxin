(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-jlreq";
    version = inputs.pkg-satysfi-class-jlreq.rev;
    sources = let
      root = inputs.pkg-satysfi-class-jlreq;
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
