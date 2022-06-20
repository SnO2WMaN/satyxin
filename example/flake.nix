{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.satyxin.url = "path:../";
  inputs.uline = {
    url = "github:puripuri2100/SATySFi-uline";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, satyxin, uline }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs {
        inherit system;
        overlays = [
          satyxin.overlay
        ];
      };
      in
      rec {
        packages = flake-utils.lib.flattenTree {
          uline = pkgs.satyxin.buildPackage {
            name = "satysfi-uline";
            src = uline;
            path = "uline.satyh";
          };
          demo = pkgs.satyxin.buildDocument {
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
