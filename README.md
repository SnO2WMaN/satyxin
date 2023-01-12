# satyxin

> Are you [SATySFi](https://github.com/gfngfn/SATySFi)-ed with [Nix](https://nixos.org/)?

[![License](https://img.shields.io/github/license/SnO2WMaN/satyxin?style=flat)](https://github.com/SnO2WMaN/satyxin/blob/main/LICENSE)

- [English](./README-en.md)

[SATySFi](https://github.com/gfngfn/SATySFi)による文書（以下，単に「文書」）を[Nix](https://nixos.org/)でビルドしたりするための様々を提供します．

## Example

[![Status](https://github.com/SnO2WMaN/satyxin/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/SnO2WMaN/satyxin/actions/workflows/gh-pages.yml)

実際にGitHub Actions上においてNixで文書をビルドした結果をGitHub Pagesに投げています．

- [basic.pdf](https://sno2wman.github.io/satyxin/basic.pdf)
  - [ソースファイル](https://github.com/SnO2WMaN/satyxinur/tree/main/example/basic)
- [slide.pdf](https://sno2wman.github.io/satyxin/basic.pdf)
  - [ソースファイル](https://github.com/SnO2WMaN/satyxinur/tree/main/example/slide)
  - オリジナルのソースは[monaqa/slydifi](https://github.com/monaqa/slydifi/tree/e9d0f57c9e27c77888582eaa9ad8b9fd35a12828/doc)から持ってきています．

## Usage

**このFlakeは現在安定していないので記載した情報が古くなっている可能性も有ります．** 必要なら開発者による[テンプレート](https://github.com/SnO2WMaN/satysfi-nixtemplate)などを参考にしてください．（おそらく最新のバージョンに追随するようにしています．）

### Requirements

- Nix (もちろん)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes#Enable_flakes)の有効化
- [nix-direnv](https://github.com/nix-community/nix-direnv)
  - 必須ではありませんが，あったほうが都合が良いです．

### Setup

`flake.nix`に次の内容を記載することで，`nix build ".#main"`で`result/main.pdf`に生成されます.

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
            # 文書をビルドするために必要なパッケージを記載してください．
            # 利用可能なすべてのパッケージは以下に存在します． https://github.com/SnO2WMaN/satyxin/tree/main/pkgs
            packages = [
              "bibyfi"
              "sno2wman"
            ];
          };
          main = pkgs.satyxin.buildDocument {
            inherit satysfiDist;
            satysfiLocal = ./.satysfi/local; # 必須ではありません
            name = "main";
            src = ./src;
            entrypoint = "main.saty";
            output = "main.pdf"; # 必須ではありません
          };
        }
      }
    );
}
```

次の内容を`.envrc`に書くと，direnvが読み取って`.satysfi/dist`以下に`satysfiDist`を生成します．**（書くべきです）**

```sh
#!/usr/bin/env bash
use flake

nix build ".#satysfiDist"  --out-link "$(pwd)/.satysfi/dist"
```

## References

- [AumyF/satyxin](https://github.com/AumyF/satyxin)
  - 改造元のリポジトリ
- [na4zagin3/satyrographos](https://github.com/na4zagin3/satyrographos)
  - 最もメジャーなSATySFi用パッケージマネージャ

### External flakes for satyxin

- [SnO2WMaN/satysfi-sno2wman](https://github.com/SnO2WMaN/satysfi-sno2wman)
  - Add `satyxinPackages.sno2wman`
