# satyxin

> Are you [SATySFi](https://github.com/gfngfn/SATySFi)-ed with [Nix](https://nixos.org/)?

[![License](https://img.shields.io/github/license/SnO2WMaN/satyxin?style=flat)](https://github.com/SnO2WMaN/satyxin/blob/main/LICENSE)

- [日本語](./README.md)（おそらくこちらのほうが充実しています）

## Example

[![Status](https://github.com/SnO2WMaN/satyxin/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/SnO2WMaN/satyxin/actions/workflows/gh-pages.yml)

- [basic.pdf](https://sno2wman.github.io/satyxin/basic.pdf)
  - [Source](https://github.com/SnO2WMaN/satyxinur/tree/main/example/basic)
- [slide.pdf](https://sno2wman.github.io/satyxin/basic.pdf)
  - [Source](https://github.com/SnO2WMaN/satyxinur/tree/main/example/slide)
  - Original source is [monaqa/slydifi](https://github.com/monaqa/slydifi/tree/e9d0f57c9e27c77888582eaa9ad8b9fd35a12828/doc)

## Usage

**This flake is very unstable currently.** It may be useful to see also [template](https://github.com/SnO2WMaN/satysfi-nixtemplate) by author.

### Requirements

- Nix (of course)
- Enabling [Nix Flakes](https://nixos.wiki/wiki/Flakes#Enable_flakes)
- [nix-direnv](https://github.com/nix-community/nix-direnv)
  - Not required but `SHOULD`.

### Setup

Write `flake.nix` like below, then `nix build ".#main"` to build document to `result/main.pdf`.

```nix
{
  inputs = { 
    satyxin.url = "github:SnO2WMaN/satyxin";
  };
  outputs = { 
    satyxin, 
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ 
            satyxin.overlay
          ];
        };
      in rec {
        packages = rec {
          satysfiDist = pkgs.satyxin.buildSatysfiDist {
            # Add pacakges to build your document
            # All avaliable packages https://github.com/SnO2WMaN/satyxin/tree/main/pkgs
            packages = [
              "bibyfi"
              "sno2wman"
            ];
          };
          main = pkgs.satyxin.buildDocument {
            inherit satysfiDist;
            satysfiLocal = ./.satysfi/local; # optional
            name = "main";
            src = ./src;
            entrypoint = "main.saty";
            output = "main.pdf"; # optional
          };
        }
      }
    );
}
```

Write `.envrc` by using direnv.

```sh
#!/usr/bin/env bash
use flake

nix build ".#satysfiDist"  --out-link "$(pwd)/.satysfi/dist"
```

## References

- [AumyF/satyxin](https://github.com/AumyF/satyxin)
  - Original version of this attempt.
- [na4zagin3/satyrographos](https://github.com/na4zagin3/satyrographos)
  - Most major SATySFi package manager.
