(import ../../nix/create-pkg.nix) {
  name = "fss";
  sources = {
    dirs = [
      "./src/fss"
    ];
  };
}
