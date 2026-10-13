---
title: "Random"
slug: random
description: "The methods ruby/spec describes in core/random, and which Metorex implements."
---

ruby/spec describes 11 methods in `core/random`, and Metorex implements 11 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Random#==`**: implemented, parameters `[[:req, :other]]`. Returns true if the two generators have the same internal state, otherwise false.
- **`Random#bytes`**: implemented, parameters `[[:req, :count]]`. Returns a random binary string containing `size` bytes. [An example calling it](/examples/basics-logical-keyword-precedence).
- **`Random.bytes`**: implemented, parameters `[[:req, :count]]`. Returns a random binary string. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-securerandom-lib-securerandom).
- **`Random.new`**: implemented, parameters `[[:rest]]`. Creates a new PRNG using `seed` to set the initial state. [An example calling it](/examples/array-methods-sort-comparisons).
- **`Random.new_seed`**: implemented, parameters `[]`. Returns an arbitrary seed value. [An example calling it](/examples/builtins-random-source-generator).
- **`Random#rand`**: implemented, parameters `[[:opt, :limit]]`. When `max` is an Integer, `rand` returns a random integer greater than or equal to zero and less than `max`. [An example calling it](/examples/array-methods-conversion-and-draws).
- **`Random.rand`**: implemented, parameters `[[:opt, :limit]]`. Returns a random number using the Ruby system PRNG.
- **`Random.random_number`**: implemented, parameters `[[:opt, :limit]]`.
- **`Random#seed`**: implemented, parameters `[]`. Returns the seed value used to initialize the generator. [An example calling it](/examples/builtins-random-source-generator).
- **`Random.srand`**: implemented, parameters `[[:opt, :number]]`. Seeds the system pseudo-random number generator, with `number`.
- **`Random.urandom`**: implemented, parameters `[[:req, :count]]`. Returns a string, using platform providing features. [An example calling it](/examples/builtins-random-source-generator).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
