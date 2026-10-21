---
title: Contributing
slug: contributing
description: How to build Metorex from source, run its tests and the ruby/spec suite, and send a change.
layout: page
---

Metorex is developed in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener} on GitHub. Issues and pull requests go there, and a contribution is licensed under the MIT License.

## What You Need

- Rust 1.88 or newer, since Metorex uses the 2024 edition and let chains.
- A C compiler on your `PATH` as `cc`, and `ar`. The build compiles the bundled Prism and nkf sources.
- The MRI release Metorex follows, as `ruby`, for running the ruby/spec suite and the benchmarks. mspec, the suite's driver, runs under MRI, and each spec file runs under Metorex.
- Docker, for running the Linux checks.

## Getting the Source

The ruby/spec suite and mspec are git submodules under `ruby/`.

```sh
git clone https://github.com/metorex-lang/metorex.git
cd metorex
git submodule update --init
```

## Building and Running

```sh
cargo build
cargo run -- tests/_examples/cli_flags/good_syntax.rb
cargo run
```

`cargo run` with no file starts the REPL. The binary is `target/debug/metorex`, and the [command line](/docs/cli) page lists its options.

## Running the Tests

```sh
cargo test
scripts/run_ruby_spec.sh
```

`cargo test` runs the Rust tests and the example programs under `tests/_examples`, each checked against its expected output. `scripts/run_ruby_spec.sh` runs the ruby/spec files Metorex passes, in parallel, one worker per CPU unless `JOBS` says otherwise.

Before sending a change, run:

```sh
cargo fmt --check
cargo clippy --all-targets -- -D warnings
scripts/misplaced_tests.sh
```

`scripts/misplaced_tests.sh` lists the `#[cfg(test)]` and `mod tests` modules in `src/`. Tests go in `tests/`, and none go in implementation files, including doc tests.

Coverage is measured with cargo-llvm-cov, and the target is 100%:

```sh
rustup component add llvm-tools-preview
cargo install cargo-llvm-cov
cargo llvm-cov --ignore-filename-regex 'ruby/'
```

## Running What CI Runs

`./test.sh` runs formatting, clippy, the Rust tests, and the ruby/spec suite, the last two also with the JIT compiling every unit, on this machine and in Linux containers for both architectures. On this machine it also runs the misplaced test check, and in the Linux container for this machine's architecture it measures coverage. It stops at the first step that fails.

```sh
./test.sh
./test.sh mac
./test.sh linux-amd64
```

`scripts/linux.sh` runs one command against a Linux build in the image CI uses, with the working tree mounted. `LINUX_ARCH` picks `amd64` or `arm64`.

```sh
scripts/linux.sh cargo test
LINUX_ARCH=amd64 scripts/linux.sh scripts/run_ruby_spec.sh
```

## Sending a Change

Fork the repository, work on a branch, and open a pull request describing the change. Add tests for new functionality, and make sure the checks above pass first.

## Reporting an Issue

Include the output of `metorex -V` and `rustc --version`, the operating system, the program or steps that show the problem, and what happened beside what you expected.
