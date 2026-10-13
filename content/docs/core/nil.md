---
title: "NilClass"
slug: nil
description: "The methods ruby/spec describes in core/nil, and which Metorex implements."
---

ruby/spec describes 17 methods in `core/nil`, and Metorex implements 17 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`NilClass#&`**: implemented, parameters `[[:req]]`. Returns `false`:
- **`NilClass#===`**: implemented, parameters `[[:req]]`. Returns `true` or `false`.
- **`NilClass#=~`**: implemented, parameters `[[:req]]`. Returns `nil`.
- **`NilClass#^`**: implemented, parameters `[[:req]]`. Returns `false` if `object` is `nil` or `false`, `true` otherwise:
- **`NilClass#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`NilClass#inspect`**: implemented, parameters `[]`. Returns string <code>'nil'</code>: [An example calling it](/examples/addresses-internet-addresses).
- **`NilClass#nil?`**: implemented, parameters `[]`. Returns `true`. [An example calling it](/examples/advanced-block-param-inspect).
- **`NilClass#rationalize`**: implemented, parameters `[[:rest, :args]]`. Returns zero as a Rational: [An example calling it](/examples/builtins-numeric-parts).
- **`NilClass#singleton_method`**: implemented, parameters `[[:req]]`. Similar to *method*, searches singleton method only. [An example calling it](/examples/introspection-singleton-method).
- **`NilClass#to_a`**: implemented, parameters `[]`. Returns an empty Array. [An example calling it](/examples/advanced-threads-wait-on-streams).
- **`NilClass#to_c`**: implemented, parameters `[[:rest, :args]]`. Returns zero as a Complex: [An example calling it](/examples/builtins-numeric-parts).
- **`NilClass#to_f`**: implemented, parameters `[[:rest, :args]]`. Always returns zero. [An example calling it](/examples/basics-complexes-arithmetic).
- **`NilClass#to_h`**: implemented, parameters `[]`. Returns an empty Hash. [An example calling it](/examples/array-methods-to-h-pairs).
- **`NilClass#to_i`**: implemented, parameters `[[:rest, :args]]`. Always returns zero. [An example calling it](/examples/addresses-internet-addresses).
- **`NilClass#to_r`**: implemented, parameters `[[:rest, :args]]`. Returns zero as a Rational: [An example calling it](/examples/basics-floats-methods).
- **`NilClass#to_s`**: implemented, parameters `[]`. Returns an empty String: [An example calling it](/examples/addresses-internet-addresses).
- **`NilClass#|`**: implemented, parameters `[[:req]]`. Returns `false` if `object` is `nil` or `false`, `true` otherwise:

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
