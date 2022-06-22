final: prev: {
  satyxinPackages = builtins.listToAttrs (
    map (
      name: {
        name = name;
        value = (import ./pkgs/${name}) {pkgs = prev;};
      }
    ) [
      "satysfi-uline"
      "satysfi-fss"
    ]
  );
}
