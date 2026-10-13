---
title: "parser/attr_list_ends_at_newline.rb"
slug: parser-attr-list-ends-at-newline
description: "The metorex example program parser/attr_list_ends_at_newline.rb and its output."
---

`tests/_examples/parser/attr_list_ends_at_newline.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/parser/attr_list_ends_at_newline.rb){target=_blank rel=noopener}.

```metorex
class Fake < Exception
  attr_reader :backtrace
  if true
    attr_accessor :cause
  end
end
p Fake.instance_methods(false).sort
```

Output:

```
[:backtrace, :cause, :cause=]
```
