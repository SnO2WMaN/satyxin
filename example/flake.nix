{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.satyxin.url = "github:aumyf/satyxin";
  inputs.uline = {
    flake = false;
    url = "github:puripuri2100/satysfi-uline";
  };

  outputs = { self, nixpkgs, flake-utils, uline }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          uline = lib.buildPackage { name = "satysfi-uline"; src = uline; path = "uline.satyh"; };
          demo = lib.buildDocument {
            name = "satyxin-demo";
            src = ./.;
            filename = "demo.saty";
            buildInputs = [ packages.uline ];
          };
        };
        defaultPackage = packages.demo;
      }
    );
}
