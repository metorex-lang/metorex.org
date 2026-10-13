---
title: "Struct"
slug: struct
description: "The methods ruby/spec describes in core/struct, and which Metorex implements."
---

ruby/spec describes 27 methods in `core/struct`, and Metorex implements 25 of them. The parameters are what `Method#parameters` answers under Metorex.

## Struct

- **`Struct#==`**: implemented, parameters `[[:req]]`. Returns `true` if and only if the following are true; otherwise returns `false`:
- **`Struct#[]`**: implemented, parameters `[[:req]]`. Returns a value from `self`.
- **`Struct#[]=`**: implemented, parameters `[[:req], [:req]]`. Assigns a value to a member.
- **`Struct#deconstruct`**: implemented, parameters `[]`. Returns the values in `self` as an array: [An example calling it](/examples/data-objects-value-objects).
- **`Struct#deconstruct_keys`**: implemented, parameters `[[:req]]`. Returns a hash of the name/value pairs for the given member names. [An example calling it](/examples/struct-member-methods).
- **`Struct#dig`**: implemented, parameters `[[:rest]]`. Finds and returns an object among nested objects. [An example calling it](/examples/oop-struct-basics).
- **`Struct#each`**: implemented, parameters `[]`. Calls the given block with the value of each member; returns `self`: [An example calling it](/examples/data-structures-hash-ordering).
- **`Struct#each_pair`**: implemented, parameters `[]`. Calls the given block with each member name/value pair; returns `self`: [An example calling it](/examples/struct-member-methods).
- **`Struct#eql?`**: implemented, parameters `[[:req]]`. Returns `true` if and only if the following are true; otherwise returns `false`: [An example calling it](/examples/array-methods-difference-of-structs).
- **`Struct#filter`**: implemented, parameters `[[:block, :block]]`. With a block given, returns an array of values from `self` for which the block returns a truthy value: [An example calling it](/examples/struct-member-methods).
- **`Struct#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`. [An example calling it](/examples/struct-member-methods).
- **`Struct#initialize`**: implemented, parameters `[[:rest, :values], [:keyrest, :keywords]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Struct#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/data-structures-array-splat-literals).
- **`Struct#instance_variable_get`**: implemented, parameters `[[:req]]`. Returns the value of the given instance variable, or nil if the instance variable is not set. [An example calling it](/examples/builtins-operators-coverage).
- **`Struct#instance_variables`**: implemented, parameters `[]`. Returns an array of instance variable names for the receiver. [An example calling it](/examples/struct-member-methods).
- **`Struct#length`**: implemented, parameters `[]`. Returns the number of members. [An example calling it](/examples/data-structures-arrays-searching).
- **`Struct#members`**: implemented, parameters `[]`. Returns the member names from `self` as an array: [An example calling it](/examples/c-extensions-c-structs).
- **`Struct.new`**: implemented, parameters `[[:rest]]`. <code>Struct.new</code> returns a new subclass of `Struct`. [An example calling it](/examples/struct-member-methods).
- **`Struct#select`**: implemented, parameters `[]`. With a block given, returns an array of values from `self` for which the block returns a truthy value: [An example calling it](/examples/struct-member-methods).
- **`Struct#size`**: implemented, parameters `[]`. Returns the number of members. [An example calling it](/examples/data-structures-hash-methods).
- **`Struct#to_a`**: implemented, parameters `[[:rest, :args]]`. Returns the values in `self` as an array: [An example calling it](/examples/data-structures-arrays-searching).
- **`Struct#to_h`**: implemented, parameters `[[:rest, :arguments], [:block, :block]]`. Returns a hash containing the name and value for each member: [An example calling it](/examples/struct-member-methods).
- **`Struct#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/data-structures-arrays-searching).
- **`Struct#values`**: implemented, parameters `[]`. Returns the values in `self` as an array: [An example calling it](/examples/data-structures-hash-methods).
- **`Struct#values_at`**: implemented, parameters `[[:rest]]`. Returns an array of values from `self`. [An example calling it](/examples/struct-member-methods).

## StructClass

- **`StructClass#keyword_init?`**: not implemented. [An example calling it](/examples/struct-member-methods).
- **`StructClass#members`**: not implemented. [An example calling it](/examples/c-extensions-c-structs).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
