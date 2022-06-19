{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.satyxin.url = "github:aumyf/satyxin";
  inputs.uline = {
    url = "github:puripuri2100/SATySFi-uline";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, satyxin, uline }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          uline = satyxin.lib.buildPackage { name = "satysfi-uline"; src = uline; path = "uline.satyh"; };
          demo = satyxin.lib.buildDocument {
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
