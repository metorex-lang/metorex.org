---
title: "Binding"
slug: binding
description: "The methods ruby/spec describes in core/binding, and which Metorex implements."
---

ruby/spec describes 12 methods in `core/binding`, and Metorex implements 12 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Binding#clone`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/basics-complexes-protocol).
- **`Binding#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Binding#eval`**: implemented, parameters `[[:rest]]`. Evaluates the Ruby expression(s) in *string*, in the *binding*'s context. [An example calling it](/examples/c-extensions-c-debug).
- **`Binding#implicit_parameter_defined?`**: implemented, parameters `[[:req]]`. Returns `true` if the numbered parameter or "it" parameter exists. [An example calling it](/examples/introspection-binding-implicit-parameters).
- **`Binding#implicit_parameter_get`**: implemented, parameters `[[:req]]`. Returns the value of the numbered parameter or "it" parameter. [An example calling it](/examples/introspection-binding-implicit-parameters).
- **`Binding#implicit_parameters`**: implemented, parameters `[]`. Returns the names of numbered parameters and "it" parameter that are defined in the binding. [An example calling it](/examples/introspection-binding-implicit-parameters).
- **`Binding#local_variable_defined?`**: implemented, parameters `[[:req]]`. Returns `true` if a local variable `symbol` exists. [An example calling it](/examples/stdlib-libraries-logging-to-the-system).
- **`Binding#local_variable_get`**: implemented, parameters `[[:req]]`. Returns the value of the local variable `symbol`. [An example calling it](/examples/c-extensions-c-debug).
- **`Binding#local_variable_set`**: implemented, parameters `[[:req], [:req]]`. Set local variable named `symbol` as `obj`. [An example calling it](/examples/globals-toplevel-binding-live-locals).
- **`Binding#local_variables`**: implemented, parameters `[]`. Returns the names of the binding's local variables as symbols. [An example calling it](/examples/c-extensions-c-debug).
- **`Binding#receiver`**: implemented, parameters `[]`. Returns the bound receiver of the binding object. [An example calling it](/examples/c-extensions-c-debug).
- **`Binding#source_location`**: implemented, parameters `[]`. Returns the Ruby source filename and line number of the binding object. [An example calling it](/examples/c-extensions-c-procs).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
