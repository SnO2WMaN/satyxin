{
  pkgs,
  writers,
  ...
}: (
  pkgs.writers.writeBashBin
  "satysfi-fmt-each"
  ''
    for f in "$@";
      do ${pkgs.satysfi-formatter}/bin/satysfi-fmt --write "$f"
    done
  ''
)
