{ pkgs }: {
  buildDocument = (import ./build-document.nix) { inherit pkgs; };
  buildPackage = (import ./build-package.nix) { inherit pkgs; };
}
