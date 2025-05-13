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

Directly run the executable:

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

## About

This project may seem slightly over-engineered, and indeed it is. This minimalist approach, directly executable, would also suffice:

```haskell
#!/usr/bin/env cabal
{- cabal:
build-depends: base, sysinfo
-}

import System.SysInfo

main :: IO ()
main = do
  uts <- either (const 42) uptime <$> sysInfo
  let utd = fromIntegral $ uts `div` (60*60*24)
  putStrLn $ "8" ++ replicate utd '=' ++ "D"
```

However, this project also provides a comprehensive template for a Haskell library and executable, complete with automated builds and property tests.

## Author and License

(c) 2025 Mirko Westermeier.

Released under the MIT license. See [LICENSE](LICENSE) for details.
