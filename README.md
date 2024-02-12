# Rust Project Tempate using Nix

Personal template for Rust projects using Nix.

Based off:

- [rust-nix-template](https://github.com/srid/rust-nix-template).
- [devenv](https://devenv.sh)

## Try Without Installing

```sh
nix run github:anntnzrb/rusted
# or
nix run github:anntnzrb/rusted -- foo
# or
nix run github:anntnzrb/rusted -- -z baz
```

## Features

### LSP

First-class support for [rust-analyzer](https://rust-analyzer.github.io).
Working with any editor that supports LSP, such as Emacs, Vim, etc.
is trivial.

### DevContainers (VSCode)

It is possible to use
[Visual Studio Code Remote - Containers](https://code.visualstudio.com/docs/remote/containers).
This enables working via a Docker container.

### Formatting

Via [treefmt](https://github.com/numtide/treefmt).

## COPYING

Refer to the [COPYING](./COPYING) file for licensing information.

Unless otherwise noted, all code herein is distributed under the terms of the
[GNU General Public License Version 3 or later](https://www.gnu.org/licenses/gpl-3.0.en.html).
