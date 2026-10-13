---
title: "Symbol"
slug: symbol
description: "The methods ruby/spec describes in core/symbol, and which Metorex implements."
---

ruby/spec describes 31 methods in `core/symbol`, and Metorex implements 31 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Symbol#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`, using String#<=>.
- **`Symbol#==`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is the same object as `self`, `false` otherwise.
- **`Symbol#===`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is the same object as `self`, `false` otherwise.
- **`Symbol#=~`**: implemented, parameters `[[:req]]`. Equivalent to <code>symbol.to_s =~ object</code>, including possible updates to global variables; see String#=~.
- **`Symbol#[]`**: implemented, parameters `[[:rest]]`. Equivalent to <code>symbol.to_s[]</code>; see String#[].
- **`Symbol.all_symbols`**: implemented, parameters `[[:req, :args]]`. Returns an array of all symbols currently in Ruby's symbol table: [An example calling it](/examples/builtins-comparing-values).
- **`Symbol#capitalize`**: implemented, parameters `[[:rest]]`. Equivalent to <code>sym.to_s.capitalize.to_sym</code>. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#casecmp`**: implemented, parameters `[[:req]]`. Like Symbol#<=>, but case-insensitive; equivalent to <code>self.to_s.casecmp(object.to_s)</code>: [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`Symbol#casecmp?`**: implemented, parameters `[[:req]]`. Returns `true` if `self` and `object` are equal after Unicode case folding, otherwise `false`: [An example calling it](/examples/stdlib-string-character-sets).
- **`Symbol#downcase`**: implemented, parameters `[[:rest]]`. Equivalent to <code>sym.to_s.downcase.to_sym</code>. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/symbols-and-ranges-range-identity).
- **`Symbol#empty?`**: implemented, parameters `[]`. Returns `true` if `self` is <code>:''</code>, `false` otherwise. [An example calling it](/examples/basics-stdout-redirection).
- **`Symbol#encoding`**: implemented, parameters `[]`. Equivalent to <code>self.to_s.encoding</code>; see String#encoding. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Symbol#end_with?`**: implemented, parameters `[[:rest]]`. Equivalent to <code>self.to_s.end_with?</code>; see String#end_with?. [An example calling it](/examples/coverage-branch-arms).
- **`Symbol#id2name`**: implemented, parameters `[[:rest, :args]]`. Returns a string representation of `self` (not including the leading colon): [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#inspect`**: implemented, parameters `[]`. Returns a string representation of `self` (including the leading colon): [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#intern`**: implemented, parameters `[[:rest, :args]]`. Returns `self`. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#length`**: implemented, parameters `[]`. Equivalent to <code>self.to_s.length</code>; see String#length. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#match`**: implemented, parameters `[[:rest]]`. Equivalent to <code>self.to_s.match</code>, including possible updates to global variables; see String#match. [An example calling it](/examples/builtins-frozen-answers).
- **`Symbol#match?`**: implemented, parameters `[[:rest]]`. Equivalent to <code>sym.to_s.match?</code>; see String#match. [An example calling it](/examples/c-extensions-c-procs).
- **`Symbol#name`**: implemented, parameters `[[:rest, :args]]`. Returns a frozen string representation of `self` (not including the leading colon): [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#next`**: implemented, parameters `[]`. Equivalent to <code>self.to_s.succ.to_sym</code>: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#size`**: implemented, parameters `[]`. Equivalent to <code>self.to_s.length</code>; see String#length. [An example calling it](/examples/symbols-and-ranges-reverse-walks).
- **`Symbol#slice`**: implemented, parameters `[[:rest]]`. Equivalent to <code>symbol.to_s[]</code>; see String#[]. [An example calling it](/examples/hash-methods-keys-and-merging).
- **`Symbol#start_with?`**: implemented, parameters `[[:rest]]`. Equivalent to <code>self.to_s.start_with?</code>; see String#start_with?. [An example calling it](/examples/builtins-core-state-and-time).
- **`Symbol#succ`**: implemented, parameters `[]`. Equivalent to <code>self.to_s.succ.to_sym</code>: [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#swapcase`**: implemented, parameters `[[:rest]]`. Equivalent to <code>sym.to_s.swapcase.to_sym</code>. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#to_proc`**: implemented, parameters `[]`. Returns a Proc object which calls the method with name of `self` on the first parameter and passes the remaining parameters to the method. [An example calling it](/examples/callables-copies-and-visibility).
- **`Symbol#to_s`**: implemented, parameters `[]`. Returns a string representation of `self` (not including the leading colon): [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#to_sym`**: implemented, parameters `[[:rest, :args]]`. Returns `self`. [An example calling it](/examples/symbols-and-ranges-names-and-walks).
- **`Symbol#upcase`**: implemented, parameters `[[:rest]]`. Equivalent to <code>sym.to_s.upcase.to_sym</code>. [An example calling it](/examples/symbols-and-ranges-names-and-walks).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
