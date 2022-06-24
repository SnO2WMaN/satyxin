(import ../../nix/create-pkg.nix) {
  name = "azmath";
  sources = {
    dirs = [
      "./src"
    ];
  };
}
