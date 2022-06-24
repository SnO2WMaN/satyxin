(import ../../nix/create-pkg.nix) {
  name = "code-printer";
  sources = {
    dirs = [
      "./src"
    ];
  };
}
