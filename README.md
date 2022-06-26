# satyxinur

> Are you [SATySFi](https://github.com/gfngfn/SATySFi)-ed with [Nix](https://nixos.org/)?

## Example

- [basic](https://github.com/SnO2WMaN/satyxinur/tree/main/example/basic)
- [slide](https://github.com/SnO2WMaN/satyxinur/tree/main/example/slide)
  - copied from [monaqa/slydifi](https://github.com/monaqa/slydifi/tree/e9d0f57c9e27c77888582eaa9ad8b9fd35a12828/doc)

## Usage

In random `flake.nix`

```nix
{
  inputs = { 
    satyxinur.url = "github:SnO2WMaN/satyxinur"; 
  };
  outputs = { 
    satyxinur, 
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ 
            satyxinur.overlay 
          ];
        };
      in rec {
        packages.main = pkgs.satyxin.buildDocument {
          name = "main";
          src = ./src;
          filename = "main.saty";
          buildInputs = with pkgs.satyxinPackages; [
            uline
            bibyfi
            fss
          ];
        };
      }
    );
}
```

Then, `nix build ".#main"` to build document.

### `satyxin.buildDocument`

```nix
packages.main = pkgs.satyxin.buildDocument {
  name = "main";
  src = ./src;
  filename = "main.saty";
  output = "main.pdf"; # optional
  buildInputs = with pkgs.satyxinPackages; [
    uline
    bibyfi
    fss
  ];
};
```

### `satyxin.buildPackage`

**TODO:**

## References

- [AumyF/satyxin](https://github.com/AumyF/satyxin)
  - Original version of this attempt.
- [SnO2WMaN/satyxin](https://github.com/SnO2WMaN/satyxin)
  - Forked version of [AumyF/satyxin](https://github.com/AumyF/satyxin) (_Deprecated_)
