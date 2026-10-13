---
title: "stdlib_libraries/ripper_brace_after_command_no_parens.rb"
slug: stdlib-libraries-ripper-brace-after-command-no-parens
description: "The metorex example program stdlib_libraries/ripper_brace_after_command_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/ripper_brace_after_command_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ripper_brace_after_command_no_parens.rb).

```metorex
# A `{` after a call written with arguments and no parentheses opens no
# block, so the grammar refuses the program and Ripper.sexp answers nil.
# A call the `{` can belong to keeps it.
require "ripper"

[
  "foo 1 { }",
  "p(foo 1 { })",
  "a.b 1 { }",
  "super 1 { }",
  "foo(1) { }",
  "foo (1) { }",
  "foo a { }",
  "a.b c { }",
  "super(1) { }"
].each { |source| puts "#{source.ljust 14} #{(Ripper.sexp source).nil? ? "refused" : "read"}" }
```

Output:

```
foo 1 { }      refused
p(foo 1 { })   refused
a.b 1 { }      refused
super 1 { }    refused
foo(1) { }     read
foo (1) { }    read
foo a { }      read
a.b c { }      read
super(1) { }   read
```
