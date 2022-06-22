(import ../../nix/create-pkg.nix) {
  name = "base";
  sources = {
    dirs = [
      "./src"
    ];
  };
}
