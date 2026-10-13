---
title: "Method"
slug: method
description: "The methods ruby/spec describes in core/method, and which Metorex implements."
---

ruby/spec describes 28 methods in `core/method`, and Metorex implements 23 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Method#<<`**: implemented, parameters `[[:req]]`. Returns a proc that is the composition of the given `g` and this method.
- **`Method#==`**: implemented, parameters `[[:req]]`. Two method objects are equal if they are bound to the same object and refer to the same method definition and the classes defining the methods are the same class or module.
- **`Method#===`**: implemented, parameters `[[:rest]]`. Invokes the *meth* with the specified arguments, returning the method's return value.
- **`Method#>>`**: implemented, parameters `[[:req]]`. Returns a proc that is the composition of this method and the given `g`.
- **`Method#[]`**: implemented, parameters `[[:rest]]`. Invokes the *meth* with the specified arguments, returning the method's return value.
- **`Method#arity`**: implemented, parameters `[]`. Returns an indication of the number of arguments accepted by a method. [An example calling it](/examples/methods-bound-call-inside-rescue).
- **`Method#call`**: implemented, parameters `[[:rest]]`. Invokes the *meth* with the specified arguments, returning the method's return value. [An example calling it](/examples/array-methods-counted-min-max).
- **`Method#clone`**: implemented, parameters `[]`. Returns a clone of this method. [An example calling it](/examples/hash-methods-string-keys-in-copies).
- **`Method#curry`**: implemented, parameters `[[:rest]]`. Returns a curried proc based on the method. [An example calling it](/examples/callables-curried-shapes).
- **`Method#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/array-methods-sort-by-array-keys).
- **`Method#eql?`**: implemented, parameters `[[:req]]`. Two method objects are equal if they are bound to the same object and refer to the same method definition and the classes defining the methods are the same class or module. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Method#hash`**: implemented, parameters `[]`. Returns a hash value corresponding to the method object. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Method#inspect`**: implemented, parameters `[]`. Returns a human-readable description of the underlying method. [An example calling it](/examples/array-methods-joining-and-inspecting).
- **`Method#name`**: implemented, parameters `[]`. Returns the name of the method. [An example calling it](/examples/hash-methods-key-changing-its-hash).
- **`Method#original_name`**: implemented, parameters `[]`. Returns the original name of the method. [An example calling it](/examples/methods-alias-of-a-setter).
- **`Method#owner`**: implemented, parameters `[]`. Returns the class or module on which this method is defined. [An example calling it](/examples/methods-define-method-super-from-a-subclass).
- **`Method#parameters`**: implemented, parameters `[]`. Returns the parameter information of this method. [An example calling it](/examples/methods-native-method-signatures).
- **`Method#private?`**: not implemented.
- **`Method#protected?`**: not implemented.
- **`Method#public?`**: not implemented.
- **`Method#receiver`**: implemented, parameters `[]`. Returns the bound receiver of the method object. [An example calling it](/examples/hash-methods-keys-and-merging).
- **`Method#source_location`**: implemented, parameters `[]`. Returns the location where the method was defined. [An example calling it](/examples/c-extensions-c-procs).
- **`Method#source_range`**: not implemented.
- **`Method#super_method`**: implemented, parameters `[]`. Returns a `Method` of superclass which would be called when super is used or nil if there is no method on superclass. [An example calling it](/examples/introspection-method-shapes).
- **`Method#syntax_tree`**: not implemented.
- **`Method#to_proc`**: implemented, parameters `[]`. Returns a Proc object corresponding to this method. [An example calling it](/examples/callables-copies-and-visibility).
- **`Method#to_s`**: implemented, parameters `[]`. Returns a human-readable description of the underlying method. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Method#unbind`**: implemented, parameters `[]`. Dissociates *meth* from its current receiver. [An example calling it](/examples/introspection-value-class-methods).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
