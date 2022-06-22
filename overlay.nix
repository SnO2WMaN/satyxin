final: prev: {
  satyxinPackages = builtins.listToAttrs (
    map (
      name: {
        name = name;
        value = (import ./pkgs/${name}) {pkgs = prev;};
      }
    ) [
      "base"
      "bibyfi"
      "fonts-junicode"
      "fss"
      "uline"
    ]
  );
}
