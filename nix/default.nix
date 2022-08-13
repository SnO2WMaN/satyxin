{pkgs}: {
  buildSatysfiDist = (import ./build-satysfi-dist) {inherit pkgs;};
  buildDocument = (import ./build-document) {inherit pkgs;};
  buildPackage = (import ./build-package) {inherit pkgs;};
}
