---
title: "Data"
slug: data
description: "The methods ruby/spec describes in core/data, and which Metorex implements."
---

ruby/spec describes 13 methods in `core/data`, and Metorex implements 12 of them. The parameters are what `Method#parameters` answers under Metorex.

## Data

- **`Data#==`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `other` is the same class as `self`, and all members are equal.
- **`Data#deconstruct`**: implemented, parameters `[]`. Returns the values in `self` as an array, to use in pattern matching: [An example calling it](/examples/data-objects-value-objects).
- **`Data#deconstruct_keys`**: implemented, parameters `[[:req, :keys]]`. Returns a hash of the name/value pairs, to use in pattern matching. [An example calling it](/examples/data-objects-data-member-keys).
- **`Data.define`**: implemented, parameters `[[:rest, :names], [:block, :body]]`. Defines a new Data class. [An example calling it](/examples/data-objects-data-member-keys).
- **`Data#eql?`**: implemented, parameters `[[:req, :other]]`. Equality check that is used when two items of data are keys of a Hash. [An example calling it](/examples/data-objects-value-objects).
- **`Data#hash`**: implemented, parameters `[]`. Redefines Object#hash (used to distinguish objects as Hash keys) so that data objects of the same class with same content would have the same `hash` value, and represented the same Hash key. [An example calling it](/examples/data-objects-value-objects).
- **`Data#initialize`**: implemented, parameters `[[:keyrest, :kwargs]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Data#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/data-objects-value-objects).
- **`Data#members`**: implemented, parameters `[]`. Returns the member names from `self` as an array: [An example calling it](/examples/data-objects-value-objects).
- **`Data#to_h`**: implemented, parameters `[]`. Returns Hash representation of the data object. [An example calling it](/examples/data-objects-value-objects).
- **`Data#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/data-objects-value-objects).
- **`Data#with`**: implemented, parameters `[[:rest, :args], [:keyrest, :kwargs]]`. Returns a shallow copy of `self` --- the instance variables of `self` are copied, but not the objects they reference. [An example calling it](/examples/data-objects-value-objects).

## DataClass

- **`DataClass#members`**: not implemented. [An example calling it](/examples/c-extensions-c-structs).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
