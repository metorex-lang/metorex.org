---
title: "UnboundMethod"
slug: unboundmethod
description: "The methods ruby/spec describes in core/unboundmethod, and which Metorex implements."
---

ruby/spec describes 21 methods in `core/unboundmethod`, and Metorex implements 14 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`UnboundMethod#==`**: implemented, parameters `[[:req]]`. Two unbound method objects are equal if they refer to the same method definition.
- **`UnboundMethod#arity`**: implemented, parameters `[]`. Returns an indication of the number of arguments accepted by a method. [An example calling it](/examples/c-extensions-c-methods).
- **`UnboundMethod#bind`**: not implemented. Bind *umeth* to *obj*. [An example calling it](/examples/addresses-socket-open-timeout).
- **`UnboundMethod#bind_call`**: not implemented. Bind *umeth* to *recv* and then invokes the method with the specified arguments. [An example calling it](/examples/errors-error-highlight-spots).
- **`UnboundMethod#clone`**: implemented, parameters `[]`. Returns a clone of this method. [An example calling it](/examples/basics-complexes-protocol).
- **`UnboundMethod#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`UnboundMethod#eql?`**: implemented, parameters `[[:req]]`. Two unbound method objects are equal if they refer to the same method definition. [An example calling it](/examples/array-methods-difference-of-structs).
- **`UnboundMethod#hash`**: implemented, parameters `[]`. Returns a hash value corresponding to the method object. [An example calling it](/examples/array-methods-difference-of-structs).
- **`UnboundMethod#inspect`**: implemented, parameters `[]`. Returns a human-readable description of the underlying method. [An example calling it](/examples/addresses-internet-addresses).
- **`UnboundMethod#name`**: implemented, parameters `[]`. Returns the name of the method. [An example calling it](/examples/basics-logical-keyword-precedence).
- **`UnboundMethod#original_name`**: implemented, parameters `[]`. Returns the original name of the method. [An example calling it](/examples/callables-blocks-and-methods).
- **`UnboundMethod#owner`**: implemented, parameters `[]`. Returns the class or module on which this method is defined. [An example calling it](/examples/basics-warn-categories).
- **`UnboundMethod#parameters`**: implemented, parameters `[]`. Returns the parameter information of this method. [An example calling it](/examples/callables-copies-and-visibility).
- **`UnboundMethod#private?`**: not implemented.
- **`UnboundMethod#protected?`**: not implemented.
- **`UnboundMethod#public?`**: not implemented.
- **`UnboundMethod#source_location`**: implemented, parameters `[]`. Returns the location where the method was defined. [An example calling it](/examples/c-extensions-c-procs).
- **`UnboundMethod#source_range`**: not implemented.
- **`UnboundMethod#super_method`**: implemented, parameters `[]`. Returns a `Method` of superclass which would be called when super is used or nil if there is no method on superclass. [An example calling it](/examples/introspection-method-shapes).
- **`UnboundMethod#syntax_tree`**: not implemented.
- **`UnboundMethod#to_s`**: implemented, parameters `[]`. Returns a human-readable description of the underlying method. [An example calling it](/examples/addresses-internet-addresses).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
