---
title: "Enumerator"
slug: enumerator
description: "The methods ruby/spec describes in core/enumerator, and which Metorex implements."
---

ruby/spec describes 73 methods in `core/enumerator`, and Metorex implements 73 of them. The parameters are what `Method#parameters` answers under Metorex.

## Enumerator

- **`Enumerator#+`**: implemented, parameters `[[:req, :other]]`. Returns an enumerator object generated from this enumerator and a given enumerable.
- **`Enumerator#each`**: implemented, parameters `[[:rest, :args], [:block, :block]]`. Iterates over the block according to how this Enumerator was constructed. [An example calling it](/examples/addresses-streams-over-a-path).
- **`Enumerator#each_with_index`**: implemented, parameters `[[:rest, :arguments], [:block, :block]]`. Same as Enumerator#with_index(0), i.e. [An example calling it](/examples/builtins-enumerator-walk-shapes).
- **`Enumerator#each_with_object`**: implemented, parameters `[[:req, :memo]]`. Iterates the given block for each element with an arbitrary object, `obj`, and returns `obj` [An example calling it](/examples/c-extensions-c-sequence-outlines).
- **`Enumerator#feed`**: implemented, parameters `[[:req, :value]]`. Sets the value to be returned by the next yield inside `e`.
- **`Enumerator#first`**: implemented, parameters `[[:opt, :count]]`. Returns the first element or elements. [An example calling it](/examples/advanced-condition-variables-that-deadlock).
- **`Enumerator#initialize`**: implemented, parameters `[[:opt, :size], [:block, :generator]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Enumerator#inspect`**: implemented, parameters `[]`. Creates a printable version of *e*. [An example calling it](/examples/addresses-internet-addresses).
- **`Enumerator.new`**: implemented, parameters `[[:rest]]`. Creates a new Enumerator object, which can be used as an Enumerable. [An example calling it](/examples/builtins-enumerator-walk-shapes).
- **`Enumerator#next`**: implemented, parameters `[]`. Returns the next object in the enumerator, and move the internal position forward. [An example calling it](/examples/builtins-enumerator-stepping).
- **`Enumerator#next_values`**: implemented, parameters `[]`. Returns the next object as an array in the enumerator, and move the internal position forward. [An example calling it](/examples/callables-blocks-and-methods).
- **`Enumerator#peek`**: implemented, parameters `[]`. Returns the next object in the enumerator, but doesn't move the internal position forward. [An example calling it](/examples/builtins-enumerator-stepping).
- **`Enumerator#peek_values`**: implemented, parameters `[]`. Returns the next object as an array, similar to Enumerator#next_values, but doesn't move the internal position forward. [An example calling it](/examples/callables-blocks-and-methods).
- **`Enumerator.produce`**: implemented, parameters `[[:rest, :first], [:key, :size], [:keyrest, :unknown], [:block, :step]]`. Creates an infinite enumerator from any block, just called over and over. [An example calling it](/examples/enumerable-lazy-value-packing).
- **`Enumerator.product`**: implemented, parameters `[[:rest, :walks], [:keyrest, :keywords]]`. Generates a new enumerator object that generates a Cartesian product of given enumerable objects. [An example calling it](/examples/enumerable-products-and-ends).
- **`Enumerator#rewind`**: implemented, parameters `[]`. Rewinds the enumeration sequence to the beginning. [An example calling it](/examples/builtins-argf-stream).
- **`Enumerator#size`**: implemented, parameters `[]`. Returns the size of the enumerator, or `nil` if it can't be calculated lazily. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Enumerator#with_index`**: implemented, parameters `[[:opt, :offset], [:block, :block]]`. Iterates the given block for each element with an index, which starts from `offset`. [An example calling it](/examples/array-methods-sort-by-enumerator).
- **`Enumerator#with_object`**: implemented, parameters `[[:req, :memo]]`. Iterates the given block for each element with an arbitrary object, `obj`, and returns `obj`

## Enumerator::ArithmeticSequence

- **`Enumerator::ArithmeticSequence#==`**: implemented, parameters `[[:req, :other]]`. Returns `true` only if `obj` is an Enumerator::ArithmeticSequence, has equivalent begin, end, step, and exclude_end?
- **`Enumerator::ArithmeticSequence.allocate`**: implemented, parameters `[]`.
- **`Enumerator::ArithmeticSequence#begin`**: implemented, parameters `[]`. Returns the number that defines the first element of this arithmetic sequence. [An example calling it](/examples/encodings-regexp-encodings).
- **`Enumerator::ArithmeticSequence#each`**: implemented, parameters `[[:block, :block]]`. [An example calling it](/examples/addresses-streams-over-a-path).
- **`Enumerator::ArithmeticSequence#end`**: implemented, parameters `[]`. Returns the number that defines the end of this arithmetic sequence. [An example calling it](/examples/control-flow-if-expression).
- **`Enumerator::ArithmeticSequence#exclude_end?`**: implemented, parameters `[]`. Returns `true` if this arithmetic sequence excludes its end value. [An example calling it](/examples/enumerable-stepping-and-products).
- **`Enumerator::ArithmeticSequence#first`**: implemented, parameters `[[:opt, :count]]`. Returns the first number in this arithmetic sequence, or an array of the first `n` elements. [An example calling it](/examples/advanced-condition-variables-that-deadlock).
- **`Enumerator::ArithmeticSequence#hash`**: implemented, parameters `[]`. Compute a hash-value for this arithmetic sequence. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Enumerator::ArithmeticSequence#inspect`**: implemented, parameters `[]`. Convert this arithmetic sequence to a printable form. [An example calling it](/examples/addresses-internet-addresses).
- **`Enumerator::ArithmeticSequence#last`**: implemented, parameters `[[:opt, :count]]`. Returns the last number in this arithmetic sequence, or an array of the last `n` elements. [An example calling it](/examples/array-methods-set-operations-and-lookup).
- **`Enumerator::ArithmeticSequence.new`**: implemented, parameters `[[:rest]]`. Creates a new Enumerator object, which can be used as an Enumerable. [An example calling it](/examples/enumerable-stepping-and-products).
- **`Enumerator::ArithmeticSequence#size`**: implemented, parameters `[]`. Returns the number of elements in this arithmetic sequence if it is a finite sequence. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Enumerator::ArithmeticSequence#step`**: implemented, parameters `[]`. Returns the number that defines the common difference between two adjacent elements in this arithmetic sequence. [An example calling it](/examples/array-methods-strided-slices).

## Enumerator::Chain

- **`Enumerator::Chain#each`**: implemented, parameters `[]`. Iterates over the elements of the first enumerable by calling the "each" method on it with the given arguments, then proceeds to the following enumerables in sequence until all of the enumerables are exhausted. [An example calling it](/examples/addresses-streams-over-a-path).
- **`Enumerator::Chain#initialize`**: implemented, parameters `[[:rest, :walks]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Enumerator::Chain#inspect`**: implemented, parameters `[]`. Returns a printable version of the enumerator chain. [An example calling it](/examples/addresses-internet-addresses).
- **`Enumerator::Chain#rewind`**: implemented, parameters `[]`. Rewinds the enumerator chain by calling the "rewind" method on each enumerable in reverse order. [An example calling it](/examples/builtins-argf-stream).
- **`Enumerator::Chain#size`**: implemented, parameters `[]`. Returns the total size of the enumerator chain calculated by summing up the size of each enumerable in the chain. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).

## Enumerator::Lazy

- **`Enumerator::Lazy#chunk`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#chunk, but chains operation to be lazy-evaluated.
- **`Enumerator::Lazy#chunk_while`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#chunk_while, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#collect`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#map, but chains operation to be lazy-evaluated. [An example calling it](/examples/callables-forwarded-block-scope).
- **`Enumerator::Lazy#collect_concat`**: implemented, parameters `[[:block, :block]]`. Returns a new lazy enumerator with the concatenated results of running `block` once for every element in the lazy enumerator.
- **`Enumerator::Lazy#compact`**: implemented, parameters `[]`. Like Enumerable#compact, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#drop`**: implemented, parameters `[[:req, :count]]`. Like Enumerable#drop, but chains operation to be lazy-evaluated. [An example calling it](/examples/c-extensions-c-sequences).
- **`Enumerator::Lazy#drop_while`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#drop_while, but chains operation to be lazy-evaluated. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Enumerator::Lazy#eager`**: implemented, parameters `[]`. Returns a non-lazy Enumerator converted from the lazy enumerator. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#enum_for`**: implemented, parameters `[[:opt, :method_name], [:rest, :args], [:block, :size]]`. Similar to Object#to_enum, except it returns a lazy enumerator. [An example calling it](/examples/builtins-enumerator-stepping).
- **`Enumerator::Lazy#filter`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#select, but chains operation to be lazy-evaluated. [An example calling it](/examples/algorithms-matrix-nested-ops).
- **`Enumerator::Lazy#filter_map`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#filter_map, but chains operation to be lazy-evaluated. [An example calling it](/examples/encodings-conversion-error-details).
- **`Enumerator::Lazy#find_all`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#select, but chains operation to be lazy-evaluated. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-plugin-index).
- **`Enumerator::Lazy#flat_map`**: implemented, parameters `[[:block, :block]]`. Returns a new lazy enumerator with the concatenated results of running `block` once for every element in the lazy enumerator. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#force`**: implemented, parameters `[[:rest, :args]]`. Expands `lazy` enumerator to an array. [An example calling it](/examples/enumerable-lazy-value-packing).
- **`Enumerator::Lazy#grep`**: implemented, parameters `[[:req, :pattern], [:block, :block]]`. Like Enumerable#grep, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerator::Lazy#grep_v`**: implemented, parameters `[[:req, :pattern], [:block, :block]]`. Like Enumerable#grep_v, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerator::Lazy#initialize`**: implemented, parameters `[[:opt, :source], [:opt, :size], [:block, :transform]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Enumerator::Lazy#lazy`**: implemented, parameters `[]`. Returns self. [An example calling it](/examples/enumerable-lazy-enum-for).
- **`Enumerator::Lazy#map`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#map, but chains operation to be lazy-evaluated. [An example calling it](/examples/advanced-case-in-coverage).
- **`Enumerator::Lazy#reject`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#reject, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#select`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#select, but chains operation to be lazy-evaluated. [An example calling it](/examples/addresses-uniform-resources).
- **`Enumerator::Lazy#slice_after`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#slice_after, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#slice_before`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#slice_before, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#slice_when`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#slice_when, but chains operation to be lazy-evaluated. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerator::Lazy#take`**: implemented, parameters `[[:req, :count]]`. Like Enumerable#take, but chains operation to be lazy-evaluated. [An example calling it](/examples/data-structures-array-take-drop).
- **`Enumerator::Lazy#take_while`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#take_while, but chains operation to be lazy-evaluated. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Enumerator::Lazy#to_enum`**: implemented, parameters `[[:opt, :method_name], [:rest, :args], [:block, :size]]`. Similar to Object#to_enum, except it returns a lazy enumerator. [An example calling it](/examples/builtins-enumerator-stepping).
- **`Enumerator::Lazy#uniq`**: implemented, parameters `[[:block, :block]]`. Like Enumerable#uniq, but chains operation to be lazy-evaluated. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Enumerator::Lazy#with_index`**: implemented, parameters `[[:opt, :offset], [:block, :block]]`. If a block is given, returns a lazy enumerator that will iterate over the given block for each element with an index, which starts from `offset`, and returns a lazy enumerator that yields the same values (without the index). [An example calling it](/examples/array-methods-sort-by-enumerator).
- **`Enumerator::Lazy#zip`**: implemented, parameters `[[:rest, :others], [:block, :block]]`. Like Enumerable#zip, but chains operation to be lazy-evaluated. [An example calling it](/examples/algorithms-zip-merger).

## Enumerator::Product

- **`Enumerator::Product#each`**: implemented, parameters `[[:block, :block]]`. Iterates over the elements of the first enumerable by calling the "each_entry" method on it with the given arguments, then proceeds to the following enumerables in sequence until all of the enumerables are exhausted. [An example calling it](/examples/addresses-streams-over-a-path).
- **`Enumerator::Product#initialize`**: implemented, parameters `[[:rest, :enumerables]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Enumerator::Product#initialize_copy`**: implemented, parameters `[[:req, :other]]`.
- **`Enumerator::Product#inspect`**: implemented, parameters `[]`. Returns a printable version of the product enumerator. [An example calling it](/examples/addresses-internet-addresses).
- **`Enumerator::Product#rewind`**: implemented, parameters `[]`. Rewinds the product enumerator by calling the "rewind" method on each enumerable in reverse order. [An example calling it](/examples/builtins-argf-stream).
- **`Enumerator::Product#size`**: implemented, parameters `[]`. Returns the total size of the enumerator product calculated by multiplying the sizes of enumerables in the product. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
