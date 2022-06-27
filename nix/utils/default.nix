{pkgs}: {
  merge-satysfi-hash = (import ./merge-satysfi-hash.nix) {inherit pkgs;};
}
