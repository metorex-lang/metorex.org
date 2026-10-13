---
title: "Proc"
slug: proc
description: "The methods ruby/spec describes in core/proc, and which Metorex implements."
---

ruby/spec describes 26 methods in `core/proc`, and Metorex implements 23 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Proc#<<`**: implemented, parameters `[[:req, :other]]`. Returns a proc that is the composition of this proc and the given *g*.
- **`Proc#==`**: implemented, parameters `[[:req]]`. Two procs are the same if, and only if, they were created from the same code block.
- **`Proc#===`**: implemented, parameters `[[:rest]]`. Invokes the block, setting the block's parameters to the arguments using something close to method calling semantics.
- **`Proc#>>`**: implemented, parameters `[[:req, :other]]`. Returns a proc that is the composition of this proc and the given *g*.
- **`Proc#[]`**: implemented, parameters `[[:rest]]`. Invokes the block, setting the block's parameters to the arguments using something close to method calling semantics.
- **`Proc.allocate`**: implemented, parameters `[[:req, :args]]`. [An example calling it](/examples/sets-membership-and-allocation).
- **`Proc#arity`**: implemented, parameters `[]`. Returns the number of mandatory arguments. [An example calling it](/examples/procs-lambda-literal-chaining).
- **`Proc#binding`**: implemented, parameters `[]`. Returns the binding associated with *prc*. [An example calling it](/examples/procs-binding-receiver).
- **`Proc#call`**: implemented, parameters `[[:rest]]`. Invokes the block, setting the block's parameters to the arguments using something close to method calling semantics. [An example calling it](/examples/procs-kernel-proc).
- **`Proc#clone`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/basics-complexes-protocol).
- **`Proc#curry`**: implemented, parameters `[[:opt, :count]]`. Returns a curried proc. [An example calling it](/examples/callables-curried-shapes).
- **`Proc#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/procs-binding-receiver).
- **`Proc#eql?`**: implemented, parameters `[[:req]]`. Two procs are the same if, and only if, they were created from the same code block. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Proc#hash`**: implemented, parameters `[]`. Returns a hash value corresponding to proc body. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Proc#inspect`**: implemented, parameters `[]`. Returns the unique identifier for this proc, along with an indication of where the proc was defined. [An example calling it](/examples/procs-kernel-proc).
- **`Proc#lambda?`**: implemented, parameters `[]`. Returns `true` if a Proc object is lambda. [An example calling it](/examples/procs-kernel-proc).
- **`Proc.new`**: implemented, parameters `[[:rest]]`. Creates a new Proc object, bound to the current context. [An example calling it](/examples/introspection-builtin-method-listings).
- **`Proc#parameters`**: implemented, parameters `[[:rest]]`. Returns the parameter information of this proc. [An example calling it](/examples/callables-copies-and-visibility).
- **`Proc#refined`**: not implemented.
- **`Proc#ruby2_keywords`**: implemented, parameters `[]`. Marks the proc as passing keywords through a normal argument splat. [An example calling it](/examples/callables-keyword-forwarding).
- **`Proc#source_location`**: implemented, parameters `[]`. Returns the location where the Proc was defined. [An example calling it](/examples/c-extensions-c-procs).
- **`Proc#source_range`**: not implemented.
- **`Proc#syntax_tree`**: not implemented.
- **`Proc#to_proc`**: implemented, parameters `[]`. Part of the protocol for converting objects to Proc objects. [An example calling it](/examples/procs-symbol-blocks).
- **`Proc#to_s`**: implemented, parameters `[]`. Returns the unique identifier for this proc, along with an indication of where the proc was defined. [An example calling it](/examples/addresses-internet-addresses).
- **`Proc#yield`**: implemented, parameters `[[:rest]]`. Invokes the block, setting the block's parameters to the arguments using something close to method calling semantics. [An example calling it](/examples/builtins-loop-enumerator).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
