---
title: "syntax/statement_conditionals.rb"
slug: syntax-statement-conditionals
description: "The metorex example program syntax/statement_conditionals.rb and its output."
---

`tests/_examples/syntax/statement_conditionals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/statement_conditionals.rb).

```metorex
# An `if` written as a statement takes `then` after its condition and after
# each `elsif` condition, with the branch on the same line.
labels = [0, 5, 500].map do |value|
  if value.zero? then "zero"
  elsif value < 10 then "small"
  else "large"
  end
end
p(labels)

# A constant of a scope enclosing the code, or of one of its ancestors,
# comes ahead of a top-level constant of the same name.
module Library
  class NameError < StandardError; end

  class Reader
    def failure = NameError
  end
end
p(Library::Reader.new.failure)
```

Output:

```
["zero", "small", "large"]
Library::NameError
```
