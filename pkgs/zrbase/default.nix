(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "zrbase";
    version = inputs.pkg-satysfi-zrbase.rev;
    sources = let
      root = inputs.pkg-satysfi-zrbase;
    in [
      "${root}/zexn0.satyg"
      "${root}/zfmt0.satyg"
      "${root}/zl0.satyg"
      "${root}/zlist0.satyg"
      "${root}/zlog0.satyg"
      "${root}/zmtdoc0.satyh"
      "${root}/znum0.satyg"
      "${root}/zp0.satyg"
      "${root}/zrandom0.satyg"
      "${root}/zrbase0.satyg"
      "${root}/zresult0.satyg"
      "${root}/zs0.satyg"
    ];
  }
)
