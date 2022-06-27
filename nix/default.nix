{pkgs}: {
  buildSatydist = (import ./build-satydist) {inherit pkgs;};
  buildDocument = (import ./build-document.nix) {inherit pkgs;};
  buildPackage = (import ./build-package) {inherit pkgs;};
}
