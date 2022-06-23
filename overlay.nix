final: prev: {
  satyxinPackages = let
    mkPkg = name: {deps ? []}:
      (import ./pkgs/${name}) {
        inherit deps;
        pkgs = prev;
      };
  in rec {
    base = mkPkg "base" {};
    bibyfi = mkPkg "bibyfi" {};
    uline = mkPkg "uline" {};
    fonts-junicode = mkPkg "fonts-junicode" {};
    fss = mkPkg "fss" {deps = [fonts-junicode];};
    easytable = mkPkg "easytable" {deps = [base];};
  };
}
