---
title: "FalseClass"
slug: false
description: "The methods ruby/spec describes in core/false, and which Metorex implements."
---

ruby/spec describes 8 methods in `core/false`, and Metorex implements 8 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`FalseClass#&`**: implemented, parameters `[[:req]]`. Returns `false`:
- **`FalseClass#===`**: implemented, parameters `[[:req]]`. Returns `true` or `false`.
- **`FalseClass#^`**: implemented, parameters `[[:req]]`. Returns `false` if `object` is `nil` or `false`, `true` otherwise:
- **`FalseClass#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`FalseClass#inspect`**: implemented, parameters `[]`. The string representation of `false` is "false". [An example calling it](/examples/addresses-internet-addresses).
- **`FalseClass#singleton_method`**: implemented, parameters `[[:req]]`. Similar to *method*, searches singleton method only. [An example calling it](/examples/introspection-singleton-method).
- **`FalseClass#to_s`**: implemented, parameters `[]`. The string representation of `false` is "false". [An example calling it](/examples/addresses-internet-addresses).
- **`FalseClass#|`**: implemented, parameters `[[:req]]`. Returns `false` if `object` is `nil` or `false`, `true` otherwise:

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
