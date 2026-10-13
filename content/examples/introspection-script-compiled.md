---
title: "introspection/script_compiled.rb"
slug: introspection-script-compiled
description: "The metorex example program introspection/script_compiled.rb and its output."
---

`tests/_examples/introspection/script_compiled.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/script_compiled.rb){target=_blank rel=noopener}.

```metorex
# Every string the interpreter compiles fires a `:script_compiled` event, and
# the trace reads the source back out of it.
compiled = []

trace = TracePoint.new :script_compiled do |event|
  compiled << event.eval_script
end

trace.enable do
  eval "def greeting\n  'hello'\nend\n"
  eval "1 + 1"
end

p compiled
p greeting
```

Output:

```
["def greeting\n  'hello'\nend\n", "1 + 1"]
"hello"
```
