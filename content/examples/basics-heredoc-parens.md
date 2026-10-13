---
title: "basics/heredoc_parens.rb"
slug: basics-heredoc-parens
description: "The metorex example program basics/heredoc_parens.rb and its output."
---

`tests/_examples/basics/heredoc_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/heredoc_parens.rb).

```metorex
# Heredoc examples (method calls with parens)
text = <<~HEREDOC
  Hello, World!
  This is a heredoc.
HEREDOC
puts(text)

greeting = <<~MSG
  Good morning!
MSG
puts(greeting.strip)
```

Output:

```
Hello, World!
This is a heredoc.
Good morning!
```
