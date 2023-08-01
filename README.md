# kachick.github.io

[![CI](https://github.com/kachick/kachick.github.io/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/kachick/kachick.github.io/actions/workflows/ci.yml?query=event%3Apush++)
[![Deploy](https://github.com/kachick/kachick.github.io/actions/workflows/pages.yml/badge.svg)](https://github.com/kachick/kachick.github.io/actions/workflows/pages.yml)
[![CI - Nix Status](https://github.com/kachick/kachick.github.io/actions/workflows/ci-nix.yml/badge.svg?branch=main)](https://github.com/kachick/kachick.github.io/actions/workflows/ci-nix.yml?query=branch%3Amain+)

<https://kachick.github.io/>

## How to development

```console
> nix-shell
> deno task serve
Listening on http://localhost:4507/
```

Then you can access to <http://localhost:4507/>

There are some tasks for tests and stylelint

```console
> deno task
> deno task check
> deno task stylelint
...
```
