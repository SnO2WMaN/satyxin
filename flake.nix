{
  description = "Build SATySFi documents using Nix";

  inputs.flake-utils.url = "github:numtide/flake-utils";


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
      }
    );
}
