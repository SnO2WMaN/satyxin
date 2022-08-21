(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "enumitem";
    src = inputs.pkg-satysfi-enumitem;
    version = inputs.pkg-satysfi-enumitem.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
