---
title: "Comparable"
slug: comparable
description: "The methods ruby/spec describes in core/comparable, and which Metorex implements."
---

ruby/spec describes 7 methods in `core/comparable`, and Metorex implements 7 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Comparable#<`**: implemented, parameters `[[:req]]`. Returns whether `self` is "less than" `other`; equivalent to <code>(self <=> other) < 0</code>:
- **`Comparable#<=`**: implemented, parameters `[[:req]]`. Returns whether `self` is "less than or equal to" `other`; equivalent to <code>(self <=> other) <= 0</code>:
- **`Comparable#==`**: implemented, parameters `[[:req]]`. Compares two objects based on the receiver's <code><=></code> method, returning true if it returns 0.
- **`Comparable#>`**: implemented, parameters `[[:req]]`. Compares two objects based on the receiver's <code><=></code> method, returning true if it returns a value greater than 0.
- **`Comparable#>=`**: implemented, parameters `[[:req]]`. Compares two objects based on the receiver's <code><=></code> method, returning true if it returns a value greater than or equal to 0.
- **`Comparable#between?`**: implemented, parameters `[[:req], [:req]]`. Returns `false` if *obj* <code><=></code> *min* is less than zero or if *obj* <code><=></code> *max* is greater than zero, `true` otherwise. [An example calling it](/examples/builtins-random-source-generator).
- **`Comparable#clamp`**: implemented, parameters `[[:rest]]`. In <code>(min, max)</code> form, returns *min* if *obj* <code><=></code> *min* is less than zero, *max* if *obj* <code><=></code> *max* is greater than zero, and *obj* otherwise. [An example calling it](/examples/methods-argument-forwarding).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
