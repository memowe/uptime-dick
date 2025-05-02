# Uptime days visualization tool

This tool is a standard cabal package with an executable named `ud` and can be built and installed using standard cabal procedures:

## Preparations

Build dependencies:

```bash
$ cabal update
$ cabal build --enable-tests --only-dependencies
```

Build everything:

```bash
$ cabal build --enable-tests
```

Test the library (including property tests):

```bash
$ cabal test --test-show-details=direct
Running 1 test suites...
Test suite uptime-dick-tests: RUNNING...
Dick conversion
  Simple int example [✔]
  Universal properties of dick
    Always starts with balls [✔]
      +++ OK, passed 100 tests.
    ...
```

Dry-run the executable:

```bash
$ cabal run ud
8======D
```

## Install and run the executable as a command

```bash
$ cabal install
$ ud
8===========D
```

## Author and License

(c) 2025 Mirko Westermeier.

Released under the MIT license. See [LICENSE](LICENSE) for details.
