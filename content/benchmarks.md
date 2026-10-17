---
title: Benchmarks
slug: benchmarks
description: Metorex beside CRuby with and without YJIT on startup, the scripts in the metorex benchmarks directory, the ruby-bench suite, and the Rex suite, with time and peak memory for each.
layout: page
---

The numbers below were measured while Metorex ran the syntax tree directly, before it compiled to bytecode, and it is slower than CRuby. The table below gives the numbers for the benchmarks in the `benchmarks/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, beside CRuby with and without YJIT.

## Results

| Machine | OS | Metorex | CRuby |
| :-- | :-- | :-- | :-- |
| Apple M5 Max, 18 CPUs, 64 GB | macOS 27.0.1 | 0.1.0, release build, rustc 1.96.0 | 4.0.6 (2026-07-14 revision 03b6d3f889) +PRISM |

| Benchmark | CRuby | CRuby --yjit | Metorex | Metorex ÷ CRuby | Metorex ÷ YJIT | CRuby peak | YJIT peak | Metorex peak |
| :-- | --: | --: | --: | --: | --: | --: | --: | --: |
| empty | 26.5 ms | 26.3 ms | 47.9 ms | 1.8× | 1.8× | 19 MB | 19 MB | 49 MB |
| block_calls | 34.5 ms | 33.7 ms | 567.6 ms | 16.4× | 16.9× | 19 MB | 19 MB | 49 MB |
| hash_access | 48.5 ms | 47.2 ms | 323.3 ms | 6.7× | 6.8× | 28 MB | 29 MB | 74 MB |
| method_calls | 33.0 ms | 30.3 ms | 469.2 ms | 14.2× | 15.5× | 19 MB | 19 MB | 49 MB |
| object_allocation | 37.2 ms | 33.6 ms | 854.2 ms | 22.9× | 25.4× | 19 MB | 20 MB | 49 MB |
| string_building | 40.5 ms | 39.7 ms | 223.4 ms | 5.5× | 5.6× | 25 MB | 26 MB | 72 MB |
| cycles | 50.8 ms | 49.0 ms | 553.7 ms | 10.9× | 11.3× | 19 MB | 20 MB | 551 MB |
| no_cycles | 34.1 ms | 32.2 ms | 411.0 ms | 12.0× | 12.8× | 19 MB | 20 MB | 49 MB |
| 30k_ifelse | 312.1 ms | 80.3 ms | 8.59 s | 27.5× | 106.9× | 116 MB | 159 MB | 545 MB |
| 30k_methods | 247.3 ms | 47.8 ms | 4.52 s | 18.3× | 94.6× | 66 MB | 77 MB | 191 MB |
| 30k_variables | 391.8 ms | 1.19 s | 49.09 s | 125.3× | 41.2× | 41 MB | 171 MB | 175 MB |
| attr_accessor | 80.3 ms | 11.7 ms | 9.99 s | 124.4× | 853.4× | 20 MB | 21 MB | 51 MB |
| binarytrees | 152.3 ms | 71.5 ms | 9.27 s | 60.9× | 129.7× | 27 MB | 28 MB | 62 MB |
| block_methods | 1.20 s | 270.6 ms | 116.97 s | 97.6× | 432.2× | 90 MB | 101 MB | 58 MB |
| blurhash | 165.0 ms | 62.4 ms | 6.54 s | 39.6× | 104.8× | 21 MB | 22 MB | 63 MB |
| cfunc_itself | 39.1 ms | 9.7 ms | 1.09 s | 27.7× | 111.5× | 20 MB | 21 MB | 51 MB |
| etanni | 150.5 ms | 125.1 ms | 2.38 s | 15.8× | 19.0× | 29 MB | 25 MB | 68 MB |
| fannkuchredux | 235.2 ms | 85.2 ms | 7.14 s | 30.3× | 83.7× | 20 MB | 21 MB | 51 MB |
| fib | 100.6 ms | 16.6 ms | 8.54 s | 84.8× | 515.1× | 20 MB | 21 MB | 52 MB |
| getivar | 55.3 ms | 8.5 ms | 2.57 s | 46.4× | 302.3× | 20 MB | 21 MB | 51 MB |
| getivar-module | 112.1 ms | 35.1 ms | 5.58 s | 49.8× | 158.7× | 20 MB | 21 MB | 51 MB |
| keyword_args | 84.7 ms | 15.1 ms | 11.11 s | 131.2× | 737.5× | 20 MB | 21 MB | 51 MB |
| knucleotide | 15.9 ms | 16.0 ms | 318.4 ms | 20.0× | 20.0× | 22 MB | 23 MB | 52 MB |
| loops-times | 476.4 ms | 136.1 ms | 22.41 s | 47.0× | 164.7× | 22 MB | 27 MB | 51 MB |
| matmul | 231.8 ms | 97.1 ms | 9.19 s | 39.6× | 94.6× | 26 MB | 27 MB | 56 MB |
| nbody | 42.4 ms | 18.0 ms | 2.88 s | 67.9× | 159.6× | 20 MB | 21 MB | 51 MB |
| nqueens | 106.9 ms | 24.6 ms | 3.58 s | 33.5× | 145.9× | 20 MB | 22 MB | 51 MB |
| object-new | 30.3 ms | 14.8 ms | 1.18 s | 38.9× | 79.5× | 20 MB | 21 MB | 51 MB |
| object-new-initialize | 54.4 ms | 17.9 ms | 3.56 s | 65.4× | 198.1× | 20 MB | 21 MB | 51 MB |
| object-new-no-escape | 97.9 ms | 34.7 ms | 8.19 s | 83.6× | 235.7× | 20 MB | 21 MB | 51 MB |
| protoboeuf | 70.8 ms | 14.0 ms | 28.95 s | 409.0× | 2068.2× | 43 MB | 48 MB | 320 MB |
| protoboeuf-encode | 61.9 ms | 14.9 ms | 102.56 s | 1656.3× | 6892.5× | 876 MB | 3401 MB | 363 MB |
| respond_to | 95.3 ms | 6.8 ms | 4.07 s | 42.7× | 595.9× | 20 MB | 21 MB | 51 MB |
| ruby-json | 98.3 ms | 79.7 ms | 23.61 s | 240.1× | 296.2× | 21 MB | 22 MB | 328 MB |
| ruby-xor | 57.2 ms | 11.2 ms | 2.82 s | 49.2× | 251.5× | 21 MB | 22 MB | 52 MB |
| send_bmethod | 94.2 ms | 4.4 ms | 7.98 s | 84.8× | 1831.3× | 20 MB | 21 MB | 51 MB |
| send_cfunc_block | 115.7 ms | 40.7 ms | 8.18 s | 70.7× | 201.2× | 20 MB | 21 MB | 52 MB |
| send_rubyfunc_block | 59.5 ms | 11.8 ms | 7.11 s | 119.6× | 603.4× | 20 MB | 21 MB | 51 MB |
| send_rubyfunc_inline | 366.3 ms | 49.4 ms | 24.48 s | 66.8× | 495.1× | 20 MB | 21 MB | 52 MB |
| setivar | 31.2 ms | 4.6 ms | 1.08 s | 34.5× | 236.8× | 20 MB | 21 MB | 51 MB |
| setivar_object | 53.4 ms | 19.5 ms | 1.16 s | 21.8× | 59.7× | 20 MB | 21 MB | 51 MB |
| setivar_young | 53.8 ms | 19.4 ms | 1.13 s | 20.9× | 58.0× | 20 MB | 21 MB | 51 MB |
| splay | 45.2 ms | 29.8 ms | 2.71 s | 60.0× | 91.0× | 905 MB | 1003 MB | 498 MB |
| str_concat | 39.2 ms | 12.3 ms | 1.61 s | 41.0× | 131.3× | 80 MB | 86 MB | 51 MB |
| struct-new-no-escape | 61.4 ms | 34.8 ms | 3.40 s | 55.5× | 97.8× | 20 MB | 21 MB | 52 MB |
| structaref | 86.2 ms | 10.9 ms | 7.41 s | 86.0× | 681.7× | 20 MB | 21 MB | 51 MB |
| structaset | 72.0 ms | 28.3 ms | 11.47 s | 159.2× | 405.7× | 20 MB | 21 MB | 52 MB |
| sudoku | 272.9 ms | 62.8 ms | 9.02 s | 33.1× | 143.6× | 20 MB | 21 MB | 52 MB |
| throw | 8.9 ms | 6.7 ms | 566.1 ms | 63.7× | 84.2× | 20 MB | 21 MB | 51 MB |
| rex_suite | 286.2 ms | 352.5 ms | 5.47 s | 19.1× | 15.5× | 55 MB | 61 MB | 277 MB |

The ratios are Metorex's time over CRuby's and over CRuby with `--yjit`. Peak memory is the largest maximum resident set size of the run.

## How each row is timed

- **empty** is an empty file, so its row is the time to start, set up the core classes, and exit. It and the workload scripts are timed from starting the process to its exit, the fastest of three runs, and each script's output must be the same under every engine.
- **block_calls** yields to a block 200,000 times and calls a Proc 100,000 times.
- **hash_access** writes and reads 50,000 String keys, then reads a Symbol key 200,000 times.
- **method_calls** calls a method with two arguments 200,000 times.
- **object_allocation** makes 200,000 objects with two instance variables each.
- **string_building** builds 50,000 strings by appending and interpolating, then joins them.
- **cycles** makes 200,000 objects that each hold a lambda referring back to the object, and keeps none of them. Each object and its lambda refer to each other, which Metorex's reference counting never frees.
- **no_cycles** makes the same objects with an Integer in place of the lambda.
- The rows from **30k_ifelse** to **throw** are the benchmarks of [ruby-bench](https://github.com/ruby/ruby-bench){target=_blank rel=noopener}, the suite YJIT is measured with, in its headline, other, and micro categories, that need no gems. Each time is the mean of one iteration after the warmup ones, under ruby-bench's own harness. CRuby runs the harness's defaults: 15 warmup iterations, then at least 10 more and at least 10 seconds of them. Metorex runs one warmup iteration and two timed ones.
- **rex_suite** runs 3000 examples with `metorex spec`, and with RSpec 3.13 under CRuby, the fastest of three runs.

The ruby-bench benchmarks that need gems installed with `bundle install` are not run.

## Running them

From the metorex repository, with a release build:

```sh
git submodule update --init benchmarks/ruby-bench
cargo build --release
ruby benchmarks/compare.rb
```

`benchmarks/compare.rb` times `target/release/metorex` beside the `ruby` that runs it, with and without `--yjit`, and prints the table above along with the two versions. `--only=fib,etanni` limits it to the rows named.
