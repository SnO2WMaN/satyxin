(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-jlreq";
    version = inputs.pkg-satysfi-class-jlreq.rev;
    sources = {
      files = [
        "./jlreq.satyh"
        "./base.satyh"
        "./jlreq0.satyh"
        "./footnote.satyh"
        "./heading.satyh"
        "./lib.satyh"
        "./paragraph.satyh"
        "./theorem.satyh"
        "./proof.satyh"
        "./toc.satyh"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
      pagenumber
      pagestyle
    ];
  }
)
