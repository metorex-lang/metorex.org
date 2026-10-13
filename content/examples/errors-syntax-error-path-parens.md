---
title: "errors/syntax_error/path_parens.rb"
slug: errors-syntax-error-path-parens
description: "The metorex example program errors/syntax_error/path_parens.rb and its output."
---

`tests/_examples/errors/syntax_error/path_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/syntax_error/path_parens.rb).

```metorex
p(SyntaxError.new.path)
p(SyntaxError.new("unexpected end").path)

begin
  eval("if true", nil, "speccing.rb")
rescue SyntaxError => error
  puts(error.class)
  p(error.path)
end

begin
  eval("if true")
rescue SyntaxError => error
  p(error.path)
end

begin
  require_relative("bad_assignment")
rescue SyntaxError => error
  puts(error.class)
  puts(error.path.end_with?("errors/syntax_error/bad_assignment.rb"))
end
```

Output:

```
nil
nil
SyntaxError
"speccing.rb"
"(eval at tests/_examples/errors/syntax_error/path_parens.rb:12)"
SyntaxError
true
```
