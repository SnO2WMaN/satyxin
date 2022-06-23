final: prev: {
  satyxinPackages = rec {
    base = (import ./pkgs/base) {pkgs = prev;};
    bibyfi = (import ./pkgs/bibyfi) {pkgs = prev;};
    uline = (import ./pkgs/uline) {pkgs = prev;};
    fonts-junicode = (import ./pkgs/fonts-junicode) {pkgs = prev;};
    fss = (import ./pkgs/fss) {
      pkgs = prev;
      deps = [
        fonts-junicode
      ];
    };
  };
}
