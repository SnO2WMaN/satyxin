(import ../../nix/create-pkg.nix) {
  name = "uline";
  sources = {
    files = [
      "./uline.satyh"
    ];
  };
}
