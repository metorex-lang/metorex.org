---
title: Benchmarks
slug: benchmarks
description: Metorex beside CRuby on the scripts in the metorex benchmarks directory, with wall-clock time, startup time, and peak memory for each.
layout: page
---

Metorex runs the syntax tree rather than compiling it to instructions, and it is slower than CRuby. The table below gives the numbers for the scripts in the `benchmarks/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}.

## Results

| Machine | OS | Metorex | CRuby |
| :-- | :-- | :-- | :-- |
| Apple M5 Max, 18 CPUs, 64 GB | macOS 27.0.1 | 0.1.0, release build, rustc 1.96.0 | 4.0.6 (2026-07-14 revision 03b6d3f889) +PRISM |

| Script | CRuby | Metorex | Ratio | CRuby peak memory | Metorex peak memory |
| :-- | --: | --: | --: | --: | --: |
| empty | 0.024s | 0.047s | 1.9x | 18.9 MB | 48.8 MB |
| block_calls | 0.033s | 0.555s | 17.0x | 18.9 MB | 48.6 MB |
| hash_access | 0.047s | 0.311s | 6.7x | 28.0 MB | 70.9 MB |
| method_calls | 0.031s | 0.462s | 14.8x | 18.9 MB | 48.8 MB |
| object_allocation | 0.037s | 0.848s | 22.9x | 19.0 MB | 49.1 MB |
| string_building | 0.040s | 0.217s | 5.5x | 25.1 MB | 68.9 MB |

Each time is the fastest of three runs, from starting the process to its exit, so it includes startup. The ratio is Metorex's time over CRuby's. Peak memory is the largest maximum resident set size `/usr/bin/time` reported over the three runs. Each script's output is the same under both, and the comparison stops if it is not.

## The scripts

- **empty** is an empty file, so its row is the time to start, set up the core classes, and exit.
- **block_calls** yields to a block 200,000 times and calls a Proc 100,000 times.
- **hash_access** writes and reads 50,000 String keys, then reads a Symbol key 200,000 times.
- **method_calls** calls a method with two arguments 200,000 times.
- **object_allocation** makes 200,000 objects with two instance variables each.
- **string_building** builds 50,000 strings by appending and interpolating, then joins them.

## Running them

From the metorex repository, with a release build:

```sh
cargo build --release
ruby benchmarks/compare.rb
```

`benchmarks/compare.rb` times `target/release/metorex` beside the `ruby` that runs it, and prints the table above along with the two versions.
