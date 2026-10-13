---
title: "BasicObject"
slug: basicobject
description: "The methods ruby/spec describes in core/basicobject, and which Metorex implements."
---

ruby/spec describes 13 methods in `core/basicobject`, and Metorex implements 13 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`BasicObject#!`**: implemented, parameters `[]`. Boolean negate.
- **`BasicObject#!=`**: implemented, parameters `[[:req]]`. Returns true if two objects are not-equal, otherwise false.
- **`BasicObject#==`**: implemented, parameters `[[:req]]`. Equality --- At the Object level, #== returns `true` only if `obj` and `other` are the same object.
- **`BasicObject#__id__`**: implemented, parameters `[]`. Returns an integer identifier for `obj`.
- **`BasicObject#__send__`**: implemented, parameters `[[:rest]]`. Invokes the method identified by *symbol*, passing it any arguments specified. [An example calling it](/examples/constants-define-singleton-method-block-cref).
- **`BasicObject#equal?`**: implemented, parameters `[[:req]]`. Equality --- At the Object level, #== returns `true` only if `obj` and `other` are the same object. [An example calling it](/examples/advanced-fibers-that-schedule).
- **`BasicObject#initialize`**: implemented, parameters `[]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`BasicObject#instance_eval`**: implemented, parameters `[[:rest]]`. Evaluates a string containing Ruby source code, or the given block, within the context of the receiver (*obj*). [An example calling it](/examples/errors-backtrace-native-frames).
- **`BasicObject#instance_exec`**: implemented, parameters `[[:rest]]`. Executes the given block within the context of the receiver (*obj*). [An example calling it](/examples/backtraces-block-file-runner).
- **`BasicObject#method_missing`**: implemented, parameters `[[:rest]]`. Invoked by Ruby when *obj* is sent a message it cannot handle.
- **`BasicObject#singleton_method_added`**: implemented, parameters `[[:req]]`. Invoked as a callback whenever a singleton method is added to the receiver. [An example calling it](/examples/metaprogramming-singleton-hooks-added).
- **`BasicObject#singleton_method_removed`**: implemented, parameters `[[:req]]`. Invoked as a callback whenever a singleton method is removed from the receiver. [An example calling it](/examples/metaprogramming-singleton-hooks-removed).
- **`BasicObject#singleton_method_undefined`**: implemented, parameters `[[:req]]`. Invoked as a callback whenever a singleton method is undefined in the receiver. [An example calling it](/examples/metaprogramming-singleton-hooks-undefined).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
