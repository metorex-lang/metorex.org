---
title: "Class"
slug: class
description: "The methods ruby/spec describes in core/class, and which Metorex implements."
---

ruby/spec describes 9 methods in `core/class`, and Metorex implements 8 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Class#allocate`**: implemented, parameters `[]`. Allocates space for a new object of *class*'s class and does not call initialize on the new instance. [An example calling it](/examples/builtins-enumerator-walk-shapes).
- **`Class#attached_object`**: implemented, parameters `[]`. Returns the object for which the receiver is the singleton class. [An example calling it](/examples/oop-comparable-singleton-class-expr).
- **`Class#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Class.inherited`**: not implemented. Callback invoked whenever a subclass of the current class is created.
- **`Class#initialize`**: implemented, parameters `[[:rest]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Class#new`**: implemented, parameters `[[:rest]]`. Calls #allocate to create a new object of *class*'s class, then invokes that object's #initialize method, passing it *args*. [An example calling it](/examples/reopen-class-test).
- **`Class.new`**: implemented, parameters `[[:rest]]`. Creates a new anonymous (unnamed) class with the given superclass (or Object if no parameter is given). [An example calling it](/examples/backtraces-block-file-runner).
- **`Class#subclasses`**: implemented, parameters `[]`. Returns an array of classes where the receiver is the direct superclass of the class, excluding singleton classes. [An example calling it](/examples/oop-class-subclasses).
- **`Class#superclass`**: implemented, parameters `[]`. Returns the superclass of *class*, or `nil`. [An example calling it](/examples/basics-readline-and-readlines).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
