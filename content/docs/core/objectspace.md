---
title: "ObjectSpace"
slug: objectspace
description: "The methods ruby/spec describes in core/objectspace, and which Metorex implements."
---

ruby/spec describes 28 methods in `core/objectspace`, and Metorex implements 28 of them. The parameters are what `Method#parameters` answers under Metorex.

## ObjectSpace

- **`ObjectSpace._id2ref`**: implemented, parameters `[[:req, :id]]`.
- **`ObjectSpace.count_objects`**: implemented, parameters `[[:opt, :result]]`. Counts all objects grouped by type. [An example calling it](/examples/introspection-count-objects).
- **`ObjectSpace.define_finalizer`**: implemented, parameters `[[:req, :held], [:opt, :callable], [:block, :block]]`. Adds *aProc* as a finalizer, to be called after *obj* was destroyed. [An example calling it](/examples/c-extensions-c-calls).
- **`ObjectSpace.each_object`**: implemented, parameters `[[:opt, :wanted]]`. Calls the block once for each living, nonimmediate object in this Ruby process. [An example calling it](/examples/object-space-each-object).
- **`ObjectSpace.garbage_collect`**: implemented, parameters `[[:req, :args]]`. Alias of GC.start
- **`ObjectSpace.undefine_finalizer`**: implemented, parameters `[[:req, :held]]`. Removes all finalizers for *obj*.

## ObjectSpace::WeakKeyMap

- **`ObjectSpace::WeakKeyMap#[]`**: implemented, parameters `[[:req, :key]]`. Returns the value associated with the given `key` if found.
- **`ObjectSpace::WeakKeyMap#[]=`**: implemented, parameters `[[:req, :key], [:req, :value]]`. Associates the given `value` with the given `key`
- **`ObjectSpace::WeakKeyMap#clear`**: implemented, parameters `[]`. Removes all map entries; returns `self`. [An example calling it](/examples/array-methods-counted-min-max).
- **`ObjectSpace::WeakKeyMap#delete`**: implemented, parameters `[[:req, :key]]`. Deletes the entry for the given `key` and returns its associated value. [An example calling it](/examples/addresses-streams-over-a-path).
- **`ObjectSpace::WeakKeyMap#getkey`**: implemented, parameters `[[:req, :key]]`. Returns the existing equal key if it exists, otherwise returns `nil`. [An example calling it](/examples/data-structures-maps-that-hold-weakly).
- **`ObjectSpace::WeakKeyMap#inspect`**: implemented, parameters `[]`. Returns a new String containing informations about the map: [An example calling it](/examples/addresses-internet-addresses).
- **`ObjectSpace::WeakKeyMap#key?`**: implemented, parameters `[[:req, :key]]`. Returns `true` if `key` is a key in `self`, otherwise `false`. [An example calling it](/examples/algorithms-character-counter).

## ObjectSpace::WeakMap

- **`ObjectSpace::WeakMap#[]`**: implemented, parameters `[[:req, :key]]`. Returns the value associated with the given `key` if found.
- **`ObjectSpace::WeakMap#[]=`**: implemented, parameters `[[:req, :key], [:req, :value]]`. Associates the given `value` with the given `key`.
- **`ObjectSpace::WeakMap#delete`**: implemented, parameters `[[:req, :key]]`. Deletes the entry for the given `key` and returns its associated value. [An example calling it](/examples/addresses-streams-over-a-path).
- **`ObjectSpace::WeakMap#each`**: implemented, parameters `[]`. Iterates over keys and values. [An example calling it](/examples/addresses-streams-over-a-path).
- **`ObjectSpace::WeakMap#each_key`**: implemented, parameters `[]`. Iterates over keys. [An example calling it](/examples/data-structures-maps-that-hold-weakly).
- **`ObjectSpace::WeakMap#each_pair`**: implemented, parameters `[[:block, :block]]`. Iterates over keys and values. [An example calling it](/examples/callables-forwarded-block-scope).
- **`ObjectSpace::WeakMap#each_value`**: implemented, parameters `[]`. Iterates over values. [An example calling it](/examples/control-flow-break-from-a-finished-call).
- **`ObjectSpace::WeakMap#include?`**: implemented, parameters `[[:req, :key]]`. Returns `true` if `key` is a key in `self`, otherwise `false`. [An example calling it](/examples/addresses-internet-addresses).
- **`ObjectSpace::WeakMap#inspect`**: implemented, parameters `[]`. [An example calling it](/examples/addresses-internet-addresses).
- **`ObjectSpace::WeakMap#key?`**: implemented, parameters `[[:req, :key]]`. Returns `true` if `key` is a key in `self`, otherwise `false`. [An example calling it](/examples/algorithms-character-counter).
- **`ObjectSpace::WeakMap#keys`**: implemented, parameters `[]`. Returns a new Array containing all keys in the map. [An example calling it](/examples/basics-symbols-operator-names).
- **`ObjectSpace::WeakMap#length`**: implemented, parameters `[]`. Returns the number of referenced objects [An example calling it](/examples/advanced-parenless-splat).
- **`ObjectSpace::WeakMap#member?`**: implemented, parameters `[[:req, :key]]`. Returns `true` if `key` is a key in `self`, otherwise `false`. [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ObjectSpace::WeakMap#size`**: implemented, parameters `[]`. Returns the number of referenced objects [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`ObjectSpace::WeakMap#values`**: implemented, parameters `[]`. Returns a new Array containing all values in the map. [An example calling it](/examples/data-structures-hash-methods).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
