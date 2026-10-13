---
title: "require/exception_class_parens.rb"
slug: require-exception-class-parens
description: "The metorex example program require/exception_class_parens.rb and its output."
---

`tests/_examples/require/exception_class_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/exception_class_parens.rb){target=_blank rel=noopener}.

```metorex
begin
  require_relative("lib/raises_argument_error")
rescue ArgumentError => error
  puts(error.class)
  puts(error.message)
end
```

Output:

```
ArgumentError
loaded file said no
```
