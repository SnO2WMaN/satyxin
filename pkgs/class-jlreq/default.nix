(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "class-jlreq";
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
    deps = with satyxinPkgs; [
      base
      dist
      pagenumber
      pagestyle
    ];
  }
)
