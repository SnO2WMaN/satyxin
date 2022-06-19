{
  description = "Build SATySFi documents using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    uline = {
      url = "github:puripuri2100/SATySFi-uline";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, uline }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        lib = {
          buildPackage = { name, src, path }: pkgs.stdenv.mkDerivation {
            inherit src name;
            installPhase = ''
              mkdir -p $out/lib/satysfi/dist/packages/$name/
              cp $src/${path} $out/lib/satysfi/dist/packages/$name/
            '';
            setupHook = pkgs.writeText "setuphook-satysfi-package" ''
              SATYSFI_LIBPATH+=:$1/lib/satysfi
            '';
          };
          buildDocument = { name, src, filename, buildInputs ? [ ] }: pkgs.stdenv.mkDerivation {
            inherit src name;
            buildPhase = ''
              cp -r $src /work
              chmod +w /work
              cd /work
              satysfi ${filename} --output document.pdf --config $SATYSFI_LIBPATH
            '';
            installPhase = ''
              mkdir -p $out/docs
              cp /work/document.pdf $out/docs/
            '';
            buildInputs = [ pkgs.satysfi ] ++ buildInputs;
          };
        };

        packages = {
          uline = lib.buildPackage {
            name = "satysfi-uline";
            src = uline;
            path = "uline.satyh";
          };
          demo = lib.buildDocument {
            name = "satyxin-demo";
            src = ./example;
            filename = "demo.saty";
            buildInputs = [ packages.uline ];
          };
        };

        defaultPackage = packages.demo;
      }
    );
}
