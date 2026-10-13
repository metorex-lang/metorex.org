---
title: "Enumerable"
slug: enumerable
description: "The methods ruby/spec describes in core/enumerable, and which Metorex implements."
---

ruby/spec describes 61 methods in `core/enumerable`, and Metorex implements 61 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Enumerable#all?`**: implemented, parameters `[[:rest, :pattern]]`. Returns whether every element meets a given criterion. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#any?`**: implemented, parameters `[[:rest, :pattern]]`. Returns whether any element meets a given criterion. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#chain`**: implemented, parameters `[[:rest, :others]]`. Returns an enumerator object generated from this enumerator and given enumerables. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#chunk`**: implemented, parameters `[[:block, :block]]`. Each element in the returned enumerator is a 2-element array consisting of:
- **`Enumerable#chunk_while`**: implemented, parameters `[[:block, :block]]`. Creates an enumerator for each chunked elements. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#collect`**: implemented, parameters `[[:block, :block]]`. Returns an array of objects returned by the block. [An example calling it](/examples/callables-forwarded-block-scope).
- **`Enumerable#collect_concat`**: implemented, parameters `[[:block, :block]]`. Returns an array of flattened objects returned by the block.
- **`Enumerable#compact`**: implemented, parameters `[]`. Returns an array of all non-`nil` elements: [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#count`**: implemented, parameters `[[:rest, :wanted]]`. Returns the count of elements, based on an argument or block criterion, if given. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#cycle`**: implemented, parameters `[[:rest, :count]]`. When called with positive integer argument `n` and a block, calls the block with each element, then does so again, until it has done so `n` times; returns `nil`: [An example calling it](/examples/enumerable-empty-cycles).
- **`Enumerable#detect`**: implemented, parameters `[[:opt, :ifnone], [:block, :block]]`. Returns the first element for which the block returns a truthy value. [An example calling it](/examples/array-methods-counted-min-max).
- **`Enumerable#drop`**: implemented, parameters `[[:req, :count]]`. For positive integer `n`, returns an array containing all but the first `n` elements: [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#drop_while`**: implemented, parameters `[]`. Calls the block with successive elements as long as the block returns a truthy value; returns an array of all elements after that point: [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#each_cons`**: implemented, parameters `[[:req, :size]]`. Calls the block with each successive overlapped `n`-tuple of elements; returns `self`: [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#each_entry`**: implemented, parameters `[[:rest, :args]]`. Calls the given block with each element, converting multiple values from yield to an array; returns `self`: [An example calling it](/examples/enumerable-empty-cycles).
- **`Enumerable#each_slice`**: implemented, parameters `[[:req, :size]]`. Calls the block with each successive disjoint `n`-tuple of elements; returns `self`: [An example calling it](/examples/enumerable-lazy-enum-for-dispatch).
- **`Enumerable#each_with_index`**: implemented, parameters `[[:rest, :args]]`. Invoke <code>self.each</code> with <code>*args</code>. [An example calling it](/examples/enumerable-lazy-enum-for-dispatch).
- **`Enumerable#each_with_object`**: implemented, parameters `[[:req, :memo]]`. Calls the block once for each element, passing both the element and the given object: [An example calling it](/examples/enumerable-pairs-through-enumerators).
- **`Enumerable#entries`**: implemented, parameters `[[:rest, :args]]`. Returns an array containing the items in `self`: [An example calling it](/examples/data-structures-hash-methods).
- **`Enumerable#filter`**: implemented, parameters `[[:block, :block]]`. Returns an array containing elements selected by the block. [An example calling it](/examples/algorithms-matrix-nested-ops).
- **`Enumerable#filter_map`**: implemented, parameters `[]`. Returns an array containing truthy elements returned by the block. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#find`**: implemented, parameters `[[:opt, :ifnone]]`. Returns the first element for which the block returns a truthy value. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#find_all`**: implemented, parameters `[[:block, :block]]`. Returns an array containing elements selected by the block. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-plugin-index).
- **`Enumerable#find_index`**: implemented, parameters `[[:rest, :wanted]]`. Returns the index of the first element that meets a specified criterion, or `nil` if no such element is found. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#first`**: implemented, parameters `[[:rest, :count]]`. Returns the first element or elements. [An example calling it](/examples/enumerable-empty-cycles).
- **`Enumerable#flat_map`**: implemented, parameters `[]`. Returns an array of flattened objects returned by the block. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#grep`**: implemented, parameters `[[:req, :pattern]]`. Returns an array of objects based elements of `self` that match the given pattern. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerable#grep_v`**: implemented, parameters `[[:req, :pattern]]`. Returns an array of objects based on elements of `self` that <em>don't</em> match the given pattern. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerable#group_by`**: implemented, parameters `[]`. With a block given returns a hash: [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#include?`**: implemented, parameters `[[:req, :wanted]]`. Returns whether for any element <code>object == element</code>: [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerable#inject`**: implemented, parameters `[[:rest, :args]]`. Returns the result of applying a reducer to an initial value and the first element of the Enumerable. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerable#lazy`**: implemented, parameters `[]`. Returns an Enumerator::Lazy, which redefines most Enumerable methods to postpone enumeration and enumerate values only on an as-needed basis. [An example calling it](/examples/enumerable-lazy-enum-for).
- **`Enumerable#map`**: implemented, parameters `[[:block, :block]]`. Returns an array of objects returned by the block. [An example calling it](/examples/enumerable-lazy-enum-for).
- **`Enumerable#max`**: implemented, parameters `[[:rest, :count], [:block, :block]]`. Returns the element with the maximum element according to a given criterion. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#max_by`**: implemented, parameters `[[:rest, :count]]`. Returns the elements for which the block returns the maximum values. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#member?`**: implemented, parameters `[[:req, :wanted]]`. Returns whether for any element <code>object == element</code>: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`Enumerable#min`**: implemented, parameters `[[:rest, :count], [:block, :block]]`. Returns the element with the minimum element according to a given criterion. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#min_by`**: implemented, parameters `[[:rest, :count]]`. Returns the elements for which the block returns the minimum values. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#minmax`**: implemented, parameters `[[:block, :block]]`. Returns a 2-element array containing the minimum and maximum elements according to a given criterion. [An example calling it](/examples/enumerable-products-and-ends).
- **`Enumerable#minmax_by`**: implemented, parameters `[[:block, :block]]`. Returns a 2-element array containing the elements for which the block returns minimum and maximum values:
- **`Enumerable#none?`**: implemented, parameters `[[:rest, :pattern]]`. Returns whether no element meets a given criterion. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#one?`**: implemented, parameters `[[:rest, :pattern]]`. Returns whether exactly one element meets a given criterion. [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#partition`**: implemented, parameters `[]`. With a block given, returns an array of two arrays: [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#reduce`**: implemented, parameters `[[:rest, :args]]`. Returns the result of applying a reducer to an initial value and the first element of the Enumerable. [An example calling it](/examples/enumerable-folding-and-matching).
- **`Enumerable#reject`**: implemented, parameters `[]`. Returns an array of objects rejected by the block. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#reverse_each`**: implemented, parameters `[[:block, :block]]`. With a block given, calls the block with each element, but in reverse order; returns `self`: [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#select`**: implemented, parameters `[]`. Returns an array containing elements selected by the block. [An example calling it](/examples/enumerable-lazy-enum-for-dispatch).
- **`Enumerable#slice_after`**: implemented, parameters `[[:opt, :pattern], [:block, :block]]`. Creates an enumerator for each chunked elements. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#slice_before`**: implemented, parameters `[[:opt, :pattern], [:block, :block]]`. With argument `pattern`, returns an enumerator that uses the pattern to partition elements into arrays ("slices"). [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#slice_when`**: implemented, parameters `[[:block, :block]]`. Creates an enumerator for each chunked elements. [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#sort`**: implemented, parameters `[[:block, :block]]`. Returns an array containing the sorted elements of `self`. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#sort_by`**: implemented, parameters `[]`. With a block given, returns an array of elements of `self`, sorted according to the value returned by the block for each element. [An example calling it](/examples/enumerable-walking-a-collection).
- **`Enumerable#sum`**: implemented, parameters `[[:rest, :start]]`. With no block given, returns the sum of `initial_value` and the elements: [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#take`**: implemented, parameters `[[:req, :count]]`. For non-negative integer `n`, returns the first `n` elements: [An example calling it](/examples/enumerable-lazy-value-packing).
- **`Enumerable#take_while`**: implemented, parameters `[]`. Calls the block with successive elements as long as the block returns a truthy value; returns an array of all elements up to that point: [An example calling it](/examples/enumerable-lazy-walks).
- **`Enumerable#tally`**: implemented, parameters `[[:rest, :counter]]`. When argument `hash` is not given, returns a new hash whose keys are the distinct elements in `self`; each integer value is the count of occurrences of each element: [An example calling it](/examples/enumerable-predicates-and-slices).
- **`Enumerable#to_a`**: implemented, parameters `[[:rest, :args]]`. Returns an array containing the items in `self`: [An example calling it](/examples/enumerable-empty-cycles).
- **`Enumerable#to_h`**: implemented, parameters `[[:rest, :arguments], [:block, :block]]`. When `self` consists of 2-element arrays, returns a hash each of whose entries is the key-value pair formed from one of those arrays: [An example calling it](/examples/enumerable-products-and-ends).
- **`Enumerable#to_set`**: implemented, parameters `[[:rest, :args], [:block, :block]]`. Makes a set from the enumerable object with given arguments. [An example calling it](/examples/callables-blocks-and-methods).
- **`Enumerable#uniq`**: implemented, parameters `[[:block, :block]]`. With no block, returns a new array containing only unique elements; the array has no two elements `e0` and `e1` such that <code>e0.eql?(e1)</code>: [An example calling it](/examples/enumerable-empty-cycles).
- **`Enumerable#zip`**: implemented, parameters `[[:rest, :others]]`. With no block given, returns a new array `new_array` of size self.size whose elements are arrays. [An example calling it](/examples/enumerable-lazy-value-packing).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
