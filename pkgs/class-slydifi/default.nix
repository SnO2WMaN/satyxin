(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-slydifi";
    src = inputs.pkg-satysfi-class-slydifi;
    version = inputs.pkg-satysfi-class-slydifi.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      enumitem
      figbox
      base
      railway
    ];
  }
)
