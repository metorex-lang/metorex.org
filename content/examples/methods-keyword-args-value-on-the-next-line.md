---
title: "methods/keyword_args/value_on_the_next_line.rb"
slug: methods-keyword-args-value-on-the-next-line
description: "The metorex example program methods/keyword_args/value_on_the_next_line.rb and its output."
---

`tests/_examples/methods/keyword_args/value_on_the_next_line.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/keyword_args/value_on_the_next_line.rb).

```metorex
def option(name, type:, default:) = [name, type, default]

p option :level,
         type:
           [:fatal, :warn],
         default: :info
p(option(:mode,
         type:
           :plain,
         default: 1))
type = :held
default = 2
p option(:short, type:, default:)

def collect(**keywords) = keywords

level = 1
detail = 2
gathered = collect level:
detail
p gathered
p(collect(level:
))
```

Output:

```
[:level, [:fatal, :warn], :info]
[:mode, :plain, 1]
[:short, :held, 2]
{level: 2}
{level: 1}
```
