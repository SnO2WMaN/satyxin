{pkgs}: {
  buildSatydist = (import ./build-satydist) {inherit pkgs;};
  buildDocument = (import ./build-document) {inherit pkgs;};
  buildPackage = (import ./build-package) {inherit pkgs;};
}
