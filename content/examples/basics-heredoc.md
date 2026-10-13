---
title: "basics/heredoc.rb"
slug: basics-heredoc
description: "The metorex example program basics/heredoc.rb and its output."
---

`tests/_examples/basics/heredoc.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/heredoc.rb).

```metorex
# Heredoc examples
text = <<~HEREDOC
  Hello, World!
  This is a heredoc.
HEREDOC
puts text

greeting = <<~MSG
  Good morning!
MSG
puts greeting.strip
```

Output:

```
Hello, World!
This is a heredoc.
Good morning!
```
