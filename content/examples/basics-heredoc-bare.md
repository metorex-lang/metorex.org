---
title: "basics/heredoc_bare.rb"
slug: basics-heredoc-bare
description: "The metorex example program basics/heredoc_bare.rb and its output."
---

`tests/_examples/basics/heredoc_bare.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/heredoc_bare.rb).

```metorex
plain = <<TEXT
first line
second line
TEXT
p plain

upcased = <<TEXT.upcase
shout
TEXT
p upcased

name = "world"
interpolated = <<TEXT
hello #{name}
TEXT
p interpolated

literal = <<'TEXT'
no #{interpolation}
TEXT
p literal

collected = []
collected << "shovel still works"
p collected
p 1 << 3
```

Output:

```
"first line\nsecond line\n"
"SHOUT\n"
"hello world\n"
"no \#{interpolation}\n"
["shovel still works"]
8
```
