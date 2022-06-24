final: prev: {
  satyxinPackages = let
    mkPkg = name: {deps ? []}:
      (import ./pkgs/${name}) {
        inherit deps;
        pkgs = prev;
      };
  in rec {
    azmath = mkPkg "azmath" {deps = [base];};
    base = mkPkg "base" {};
    code-printer = mkPkg "code-printer" {deps = [base];};
    bibyfi = mkPkg "bibyfi" {};
    uline = mkPkg "uline" {};
    fonts-dejavu = mkPkg "fonts-dejavu" {};
    fonts-junicode = mkPkg "fonts-junicode" {};
    fss = mkPkg "fss" {deps = [fonts-junicode];};
    easytable = mkPkg "easytable" {deps = [base];};
  };
}
