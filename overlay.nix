final: prev: {
  satyxinPackages = builtins.listToAttrs (
    map (
      name: {
        name = name;
        value = (import ./pkgs/${name}) {pkgs = prev;};
      }
    ) [
      "uline"
      "fss"
      "bibyfi"
    ]
  );
}
