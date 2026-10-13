---
title: "basics/heredoc_with_args.rb"
slug: basics-heredoc-with-args
description: "The metorex example program basics/heredoc_with_args.rb and its output."
---

`tests/_examples/basics/heredoc_with_args.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/heredoc_with_args.rb){target=_blank rel=noopener}.

```metorex
def pair(a, b)
  "#{a}|#{b}"
end

puts pair(<<-EOS, "second")
first line
second line
EOS

x = <<-TXT + " world"
hello
TXT
puts x
```

Output:

```
first line
second line
|second
hello
 world
```
