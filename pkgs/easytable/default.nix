(import ../../nix/create-pkg.nix) {
  name = "easytable";
  sources = {
    dirs = [
      "./src"
    ];
  };
}
