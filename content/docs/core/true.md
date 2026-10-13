---
title: "TrueClass"
slug: true
description: "The methods ruby/spec describes in core/true, and which Metorex implements."
---

ruby/spec describes 8 methods in `core/true`, and Metorex implements 8 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`TrueClass#&`**: implemented, parameters `[[:req]]`. Returns `false` if `object` is `false` or `nil`, `true` otherwise:
- **`TrueClass#===`**: implemented, parameters `[[:req]]`. Returns `true` or `false`.
- **`TrueClass#^`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is `false` or `nil`, `false` otherwise:
- **`TrueClass#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`TrueClass#inspect`**: implemented, parameters `[]`. Returns string <code>'true'</code>: [An example calling it](/examples/addresses-internet-addresses).
- **`TrueClass#singleton_method`**: implemented, parameters `[[:req]]`. Similar to *method*, searches singleton method only. [An example calling it](/examples/introspection-singleton-method).
- **`TrueClass#to_s`**: implemented, parameters `[]`. Returns string <code>'true'</code>: [An example calling it](/examples/addresses-internet-addresses).
- **`TrueClass#|`**: implemented, parameters `[[:req]]`. Returns `true`:

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
