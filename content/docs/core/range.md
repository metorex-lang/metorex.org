---
title: "Range"
slug: range
description: "The methods ruby/spec describes in core/range, and which Metorex implements."
---

ruby/spec describes 34 methods in `core/range`, and Metorex implements 33 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Range#%`**: implemented, parameters `[[:opt, :by], [:block, :block]]`. Same as #step (but doesn't provide default value for `n`).
- **`Range#==`**: implemented, parameters `[[:req]]`. Returns `true` if and only if:
- **`Range#===`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is between <code>self.begin</code> and <code>self.end</code>.
- **`Range#begin`**: implemented, parameters `[]`. Returns the object that defines the beginning of `self`. [An example calling it](/examples/symbols-and-ranges-allocated-range).
- **`Range#bsearch`**: implemented, parameters `[]`. Returns an element from `self` selected by a binary search. [An example calling it](/examples/symbols-and-ranges-binary-search).
- **`Range#clamp`**: not implemented. [An example calling it](/examples/methods-argument-forwarding).
- **`Range#clone`**: implemented, parameters `[[:rest, :args]]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/symbols-and-ranges-range-identity).
- **`Range#count`**: implemented, parameters `[[:rest]]`. Returns the count of elements, based on an argument or block criterion, if given. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#cover?`**: implemented, parameters `[[:req]]`. Returns `true` if the given argument is within `self`, `false` otherwise. [An example calling it](/examples/symbols-and-ranges-range-cover-and-include).
- **`Range#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/symbols-and-ranges-range-identity).
- **`Range#each`**: implemented, parameters `[]`. With a block given, passes each element of `self` to the block: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#end`**: implemented, parameters `[]`. Returns the object that defines the end of `self`. [An example calling it](/examples/symbols-and-ranges-allocated-range).
- **`Range#entries`**: implemented, parameters `[]`. Returns an array containing the elements in `self`, if a finite collection; raises an exception otherwise. [An example calling it](/examples/data-structures-hash-methods).
- **`Range#eql?`**: implemented, parameters `[[:req]]`. Returns `true` if and only if: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#exclude_end?`**: implemented, parameters `[]`. Returns `true` if `self` excludes its end value; `false` otherwise: [An example calling it](/examples/symbols-and-ranges-allocated-range).
- **`Range#first`**: implemented, parameters `[[:rest]]`. With no argument, returns the first element of `self`, if it exists: [An example calling it](/examples/advanced-condition-variables-that-deadlock).
- **`Range#frozen?`**: implemented, parameters `[[:rest, :args]]`. Returns the freeze status of *obj*. [An example calling it](/examples/symbols-and-ranges-literal-range-ends).
- **`Range#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Range#include?`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is an element of `self`, `false` otherwise: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#initialize`**: implemented, parameters `[[:req, :first], [:req, :last], [:opt, :excludes]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Range#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`, including <code>begin.inspect</code> and <code>end.inspect</code>: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#last`**: implemented, parameters `[[:rest]]`. With no argument, returns the last element of `self`, if it exists: [An example calling it](/examples/array-methods-set-operations-and-lookup).
- **`Range#max`**: implemented, parameters `[[:rest]]`. Returns the maximum value in `self`, using method <code>#<=></code> or a given block for comparison. [An example calling it](/examples/array-methods-counted-min-max).
- **`Range#member?`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is an element of `self`, `false` otherwise: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`Range#min`**: implemented, parameters `[[:rest]]`. Returns the minimum value in `self`, using method <code>#<=></code> or a given block for comparison. [An example calling it](/examples/array-methods-counted-min-max).
- **`Range#minmax`**: implemented, parameters `[[:block, :block]]`. Returns a 2-element array containing the minimum and maximum value in `self`, either according to comparison method <code>#<=></code> or a given block. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Range.new`**: implemented, parameters `[[:rest]]`. Returns a new range based on the given objects `begin` and `end`. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#overlap?`**: implemented, parameters `[[:req]]`. Returns `true` if `range` overlaps with `self`, `false` otherwise: [An example calling it](/examples/builtins-comparing-values).
- **`Range#reverse_each`**: implemented, parameters `[[:block, :block]]`. With a block given, passes each element of `self` to the block in reverse order: [An example calling it](/examples/symbols-and-ranges-reverse-walks).
- **`Range#size`**: implemented, parameters `[]`. Returns the count of elements in `self` if both begin and end values are numeric; otherwise, returns `nil`: [An example calling it](/examples/symbols-and-ranges-reverse-walks).
- **`Range#step`**: implemented, parameters `[[:opt, :by], [:block, :block]]`. Iterates over the elements of range in steps of `s`. [An example calling it](/examples/symbols-and-ranges-range-cover-and-include).
- **`Range#to_a`**: implemented, parameters `[]`. Returns an array containing the elements in `self`, if a finite collection; raises an exception otherwise. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`, including <code>begin.to_s</code> and <code>end.to_s</code>: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Range#to_set`**: implemented, parameters `[[:rest, :args], [:block, :block]]`. Returns a set containing the elements in `self`, if a finite collection; raises an exception otherwise. [An example calling it](/examples/callables-blocks-and-methods).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
