---
title: "syntax/literal_condition_warnings_no_parens.rb"
slug: syntax-literal-condition-warnings-no-parens
description: "The metorex example program syntax/literal_condition_warnings_no_parens.rb and its output."
---

`tests/_examples/syntax/literal_condition_warnings_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/literal_condition_warnings_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A literal written where a test goes earns a warning while the code is
# read, whatever the verbosity: a regexp or a string literal, and an
# integer at either end of a flip-flop. A program run from a file, code
# given to eval, and code given to RubyVM::AbstractSyntaxTree.parse each
# name where the literal was written.
require "rbconfig"
require "stringio"

fixture = File.join(__dir__, "literal_conditions_fixture.rb")
output = IO.popen([RbConfig.ruby, fixture], err: [:child, :out], &:read)
puts output.gsub(File.dirname(fixture) + "/", "")

captured = StringIO.new
$stderr = captured
eval "if /a/ then end", binding, "evaluated.rb", 7
RubyVM::AbstractSyntaxTree.parse "x = 1\nif (1..2) then end\nwhile /b/ do end"
$stderr = STDERR
puts captured.string

quiet = IO.popen([RbConfig.ruby, "-W0", fixture], err: [:child, :out], &:read)
puts quiet
```

Output:

```
literal_conditions_fixture.rb:1: warning: integer literal in flip-flop
literal_conditions_fixture.rb:1: warning: integer literal in flip-flop
literal_conditions_fixture.rb:2: warning: regex literal in condition
literal_conditions_fixture.rb:3: warning: string literal in condition
literal_conditions_fixture.rb:4: warning: regex literal in condition
literal_conditions_fixture.rb:6: warning: found '= literal' in conditional, should be ==
literal_conditions_fixture.rb:7: warning: found '= literal' in conditional, should be ==
literal_conditions_fixture.rb:8: warning: found '= literal' in conditional, should be ==
nil
1
evaluated.rb:7: warning: regex literal in condition
(none):2: warning: integer literal in flip-flop
(none):2: warning: integer literal in flip-flop
(none):3: warning: regex literal in condition
nil
1
```
