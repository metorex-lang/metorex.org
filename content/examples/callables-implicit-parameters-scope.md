---
title: "callables/implicit_parameters_scope.rb"
slug: callables-implicit-parameters-scope
description: "The metorex example program callables/implicit_parameters_scope.rb and its output."
---

`tests/_examples/callables/implicit_parameters_scope.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/implicit_parameters_scope.rb){target=_blank rel=noopener}.

```metorex
puts([3].map { it * 2 }.inspect)
puts(-> { it + -> { it * it }.call(2) }.call(3))
puts(-> { it; binding.local_variables }.call("a").inspect)
puts(-> { _1 + _2; binding.local_variables }.call(1, 2).inspect)

it = 0
puts(proc { it }.call("a"))

refused = [
  "proc { |x| it }",
  "-> () { it }",
  "proc { it + _1 }",
  "proc { _1 + it }",
  "proc { _1 = 0 }",
  "proc { |x| _1 }"
]
refused.each do |source|
  begin
    eval(source)
    puts("no error for #{source}")
  rescue SyntaxError => error
    puts(error.message.split(": ").last)
  end
end
```

Output:

```
[6]
7
[:it, :refused]
[:it, :refused]
0
no error for proc { |x| it }
no error for -> () { it }
no error for proc { it + _1 }
no error for proc { _1 + it }
syntax error found
> 1 | proc { _1 = 0 }
    |        ^~ _1 is reserved for numbered parameters
syntax error found
> 1 | proc { |x| _1 }
    |            ^~ numbered parameters are not allowed when an ordinary parameter is defined
```
