---
title: Benchmarks
slug: benchmarks
description: Metorex beside CRuby with and without YJIT on startup, the scripts in the metorex benchmarks directory, the ruby-bench suite, and the Rex suite, with time and peak memory for each.
layout: page
---

The tables give the numbers for the benchmarks in the `benchmarks/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}: Metorex with its JIT and with `METOREX_JIT=0`, beside CRuby with and without YJIT.

## Results

| Architecture | Metorex | CRuby |
| :-- | :-- | :-- |
| arm64 | 0.1.0, release build, rustc 1.96.0 | 4.0.6 |

### Time

| Benchmark | CRuby | CRuby --yjit | Metorex | Metorex, no JIT | Metorex ÷ CRuby | Metorex ÷ YJIT | Metorex ÷ no JIT |
| :-- | --: | --: | --: | --: | --: | --: | --: |
| empty | 29.0 ms | 28.0 ms | 26.3 ms | 26.0 ms | 0.9× | 0.9× | 1.01 |
| block_calls | 35.4 ms | 35.4 ms | 223.2 ms | 247.0 ms | 6.3× | 6.3× | 0.90 |
| hash_access | 47.7 ms | 45.9 ms | 268.9 ms | 276.8 ms | 5.6× | 5.9× | 0.97 |
| method_calls | 31.5 ms | 29.1 ms | 211.6 ms | 222.0 ms | 6.7× | 7.3× | 0.95 |
| object_allocation | 37.4 ms | 33.7 ms | 579.7 ms | 593.9 ms | 15.5× | 17.2× | 0.98 |
| string_building | 45.2 ms | 42.1 ms | 194.9 ms | 201.4 ms | 4.3× | 4.6× | 0.97 |
| cycles | 50.9 ms | 49.5 ms | 599.3 ms | 587.0 ms | 11.8× | 12.1× | 1.02 |
| no_cycles | 34.9 ms | 32.8 ms | 347.7 ms | 344.0 ms | 9.9× | 10.6× | 1.01 |
| 30k_ifelse | 300.1 ms | 79.7 ms | 6.20 s | 5.84 s | 20.7× | 77.8× | 1.06 |
| 30k_methods | 252.1 ms | 48.8 ms | 3.53 s | 3.40 s | 14.0× | 72.2× | 1.04 |
| 30k_variables | 407.6 ms | 1.14 s | 16.34 s | 18.07 s | 40.1× | 14.3× | 0.90 |
| attr_accessor | 83.4 ms | 11.6 ms | 5.22 s | 5.48 s | 62.5× | 450.9× | 0.95 |
| binarytrees | 151.9 ms | 71.1 ms | 6.51 s | 6.76 s | 42.9× | 91.5× | 0.96 |
| block_methods | 1.20 s | 269.6 ms | 27.48 s | 31.27 s | 22.8× | 101.9× | 0.88 |
| blurhash | 164.9 ms | 62.1 ms | 3.85 s | 4.09 s | 23.3× | 62.0× | 0.94 |
| cfunc_itself | 39.6 ms | 9.7 ms | 749.5 ms | 761.5 ms | 18.9× | 77.5× | 0.98 |
| etanni | 145.6 ms | 125.0 ms | 2.42 s | 2.45 s | 16.6× | 19.4× | 0.99 |
| fannkuchredux | 230.9 ms | 83.9 ms | 3.34 s | 3.98 s | 14.5× | 39.8× | 0.84 |
| fib | 98.4 ms | 16.3 ms | 4.54 s | 4.98 s | 46.1× | 277.9× | 0.91 |
| getivar | 55.2 ms | 8.5 ms | 230.7 ms | 550.0 ms | 4.2× | 27.1× | 0.42 |
| getivar-module | 110.8 ms | 34.8 ms | 1.42 s | 1.97 s | 12.8× | 40.7× | 0.72 |
| keyword_args | 85.9 ms | 15.0 ms | 9.99 s | 10.14 s | 116.3× | 664.6× | 0.98 |
| knucleotide | 16.0 ms | 15.7 ms | 308.0 ms | 328.1 ms | 19.2× | 19.7× | 0.94 |
| loops-times | 470.3 ms | 135.3 ms | 12.17 s | 13.14 s | 25.9× | 90.0× | 0.93 |
| matmul | 228.4 ms | 98.3 ms | 5.01 s | 5.74 s | 21.9× | 50.9× | 0.87 |
| nbody | 42.7 ms | 18.2 ms | 1.44 s | 1.55 s | 33.8× | 79.1× | 0.93 |
| nqueens | 106.4 ms | 25.0 ms | 1.98 s | 2.33 s | 18.6× | 79.3× | 0.85 |
| object-new | 30.8 ms | 14.6 ms | 912.8 ms | 1.01 s | 29.6× | 62.5× | 0.91 |
| object-new-initialize | 55.3 ms | 17.8 ms | 2.38 s | 2.49 s | 43.1× | 134.0× | 0.96 |
| object-new-no-escape | 98.4 ms | 35.5 ms | 5.39 s | 5.55 s | 54.8× | 151.9× | 0.97 |
| protoboeuf | 71.3 ms | 14.1 ms | 2.84 s | 3.11 s | 39.8× | 201.6× | 0.91 |
| protoboeuf-encode | 63.0 ms | 15.2 ms | 21.95 s | 22.22 s | 348.6× | 1447.8× | 0.99 |
| respond_to | 96.4 ms | 6.8 ms | 4.50 s | 4.50 s | 46.7× | 661.2× | 1.00 |
| ruby-json | 100.1 ms | 84.6 ms | 18.06 s | 18.47 s | 180.4× | 213.6× | 0.98 |
| ruby-xor | 57.3 ms | 10.9 ms | 1.96 s | 2.12 s | 34.2× | 180.0× | 0.92 |
| send_bmethod | 93.7 ms | 4.3 ms | 6.32 s | 6.38 s | 67.4× | 1463.0× | 0.99 |
| send_cfunc_block | 119.0 ms | 40.8 ms | 9.01 s | 8.87 s | 75.7× | 220.6× | 1.02 |
| send_rubyfunc_block | 59.3 ms | 11.7 ms | 5.33 s | 5.42 s | 90.0× | 457.3× | 0.98 |
| send_rubyfunc_inline | 367.7 ms | 51.7 ms | 8.66 s | 10.87 s | 23.6× | 167.5× | 0.80 |
| setivar | 30.1 ms | 4.6 ms | 198.7 ms | 337.8 ms | 6.6× | 43.6× | 0.59 |
| setivar_object | 53.5 ms | 19.8 ms | 349.7 ms | 491.2 ms | 6.5× | 17.7× | 0.71 |
| setivar_young | 53.9 ms | 19.5 ms | 399.0 ms | 494.7 ms | 7.4× | 20.5× | 0.81 |
| splay | 46.0 ms | 31.1 ms | 2.05 s | 2.07 s | 44.5× | 65.9× | 0.99 |
| str_concat | 39.5 ms | 13.0 ms | 990.9 ms | 1.11 s | 25.1× | 76.5× | 0.89 |
| struct-new-no-escape | 62.9 ms | 35.3 ms | 2.22 s | 2.37 s | 35.3× | 62.8× | 0.93 |
| structaref | 86.8 ms | 11.2 ms | 3.29 s | 3.71 s | 38.0× | 293.2× | 0.89 |
| structaset | 73.5 ms | 28.7 ms | 8.31 s | 8.47 s | 113.1× | 289.9× | 0.98 |
| sudoku | 270.0 ms | 64.0 ms | 5.12 s | 6.02 s | 19.0× | 80.0× | 0.85 |
| throw | 9.0 ms | 6.7 ms | 417.9 ms | 407.7 ms | 46.4× | 61.9× | 1.02 |
| rex_suite | 293.6 ms | 364.3 ms | 4.82 s | 4.81 s | 16.4× | 13.2× | 1.00 |

The ratios are Metorex's time over CRuby's, over CRuby with `--yjit`, and over Metorex with `METOREX_JIT=0`.

### Peak Memory

Peak memory is the largest maximum resident set size of the run.

| Benchmark | CRuby | CRuby --yjit | Metorex | Metorex, no JIT |
| :-- | --: | --: | --: | --: |
| empty | 19 MB | 19 MB | 33 MB | 33 MB |
| block_calls | 19 MB | 19 MB | 33 MB | 33 MB |
| hash_access | 28 MB | 29 MB | 76 MB | 76 MB |
| method_calls | 19 MB | 19 MB | 33 MB | 33 MB |
| object_allocation | 19 MB | 19 MB | 34 MB | 34 MB |
| string_building | 25 MB | 26 MB | 71 MB | 74 MB |
| cycles | 19 MB | 20 MB | 35 MB | 36 MB |
| no_cycles | 19 MB | 19 MB | 34 MB | 34 MB |
| 30k_ifelse | 117 MB | 159 MB | 604 MB | 590 MB |
| 30k_methods | 66 MB | 77 MB | 193 MB | 192 MB |
| 30k_variables | 41 MB | 171 MB | 248 MB | 227 MB |
| attr_accessor | 20 MB | 21 MB | 39 MB | 39 MB |
| binarytrees | 27 MB | 28 MB | 129 MB | 140 MB |
| block_methods | 93 MB | 88 MB | 42 MB | 41 MB |
| blurhash | 21 MB | 22 MB | 44 MB | 44 MB |
| cfunc_itself | 20 MB | 21 MB | 39 MB | 38 MB |
| etanni | 28 MB | 25 MB | 66 MB | 66 MB |
| fannkuchredux | 20 MB | 21 MB | 39 MB | 39 MB |
| fib | 20 MB | 21 MB | 39 MB | 39 MB |
| getivar | 20 MB | 21 MB | 39 MB | 39 MB |
| getivar-module | 20 MB | 21 MB | 39 MB | 39 MB |
| keyword_args | 20 MB | 21 MB | 39 MB | 39 MB |
| knucleotide | 22 MB | 23 MB | 39 MB | 39 MB |
| loops-times | 22 MB | 27 MB | 39 MB | 39 MB |
| matmul | 26 MB | 27 MB | 41 MB | 41 MB |
| nbody | 20 MB | 21 MB | 39 MB | 39 MB |
| nqueens | 20 MB | 22 MB | 39 MB | 39 MB |
| object-new | 20 MB | 21 MB | 39 MB | 39 MB |
| object-new-initialize | 20 MB | 21 MB | 39 MB | 39 MB |
| object-new-no-escape | 20 MB | 21 MB | 39 MB | 39 MB |
| protoboeuf | 43 MB | 48 MB | 162 MB | 155 MB |
| protoboeuf-encode | 860 MB | 3343 MB | 377 MB | 371 MB |
| respond_to | 20 MB | 21 MB | 39 MB | 39 MB |
| ruby-json | 21 MB | 22 MB | 335 MB | 320 MB |
| ruby-xor | 21 MB | 22 MB | 39 MB | 39 MB |
| send_bmethod | 20 MB | 21 MB | 39 MB | 39 MB |
| send_cfunc_block | 20 MB | 21 MB | 39 MB | 40 MB |
| send_rubyfunc_block | 20 MB | 21 MB | 39 MB | 39 MB |
| send_rubyfunc_inline | 20 MB | 21 MB | 39 MB | 39 MB |
| setivar | 20 MB | 21 MB | 39 MB | 39 MB |
| setivar_object | 20 MB | 21 MB | 39 MB | 39 MB |
| setivar_young | 20 MB | 21 MB | 39 MB | 38 MB |
| splay | 906 MB | 1022 MB | 883 MB | 883 MB |
| str_concat | 81 MB | 94 MB | 39 MB | 39 MB |
| struct-new-no-escape | 20 MB | 21 MB | 39 MB | 39 MB |
| structaref | 20 MB | 21 MB | 39 MB | 39 MB |
| structaset | 20 MB | 21 MB | 39 MB | 39 MB |
| sudoku | 20 MB | 21 MB | 40 MB | 41 MB |
| throw | 20 MB | 21 MB | 39 MB | 39 MB |
| rex_suite | 55 MB | 61 MB | 304 MB | 303 MB |


## How Each Row Is Timed

- **empty** is an empty file, so its row is the time to start, set up the core classes, and exit. It and the workload scripts are timed from starting the process to its exit, the fastest of three runs, and each script's output must be the same under every engine.
- **block_calls** yields to a block 200,000 times and calls a Proc 100,000 times.
- **hash_access** writes and reads 50,000 String keys, then reads a Symbol key 200,000 times.
- **method_calls** calls a method with two arguments 200,000 times.
- **object_allocation** makes 200,000 objects with two instance variables each.
- **string_building** builds 50,000 strings by appending and interpolating, then joins them.
- **cycles** makes 200,000 objects that each hold a lambda referring back to the object, and keeps none of them. Each object and its lambda refer to each other, so reference counting alone cannot free them, and Metorex's cycle collector frees them.
- **no_cycles** makes the same objects with an Integer in place of the lambda.
- The rows from **30k_ifelse** to **throw** are the benchmarks of [ruby-bench](https://github.com/ruby/ruby-bench){target=_blank rel=noopener}, the suite YJIT is measured with, in its headline, other, and micro categories, that need no gems. Each time is the mean of one iteration after the warmup ones, under ruby-bench's own harness. CRuby runs the harness's defaults: 15 warmup iterations, then at least 10 more and at least 10 seconds of them. Metorex runs one warmup iteration and two timed ones.
- **rex_suite** runs 3000 examples with `metorex spec`, and with RSpec under CRuby, the fastest of three runs.

The ruby-bench benchmarks that need gems installed with `bundle install` are not run.

## Running Them

From the metorex repository, with a release build:

```sh
git submodule update --init benchmarks/ruby-bench
cargo build --release
ruby benchmarks/compare.rb
```

`benchmarks/compare.rb` times `target/release/metorex`, with its JIT and with `METOREX_JIT=0`, beside the `ruby` that runs it, with and without `--yjit`, and prints the table along with the two versions. `--without-no-jit` leaves out the `METOREX_JIT=0` column, and `--only=fib,etanni` limits it to the rows named.
