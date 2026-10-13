---
title: "callables/implicit_it_parameter.rb"
slug: callables-implicit-it-parameter
description: "The metorex example program callables/implicit_it_parameter.rb and its output."
---

`tests/_examples/callables/implicit_it_parameter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/implicit_it_parameter.rb){target=_blank rel=noopener}.

```metorex
# A block that names no parameters and mentions a bare `it` takes the first
# argument under that name. The parameter has no name of its own, so a proc
# reports it as optional and a lambda as required.
p(proc { it }.call("a"))
p(-> { it }.call("b"))
p(["c", "d"].map { it })
p(proc { it }.parameters)
p(-> { it }.parameters)
p(-> { it }.arity)
p(proc { it }.call)

# A name written as a method call is that call, not the parameter.
def it(described)
  described.upcase
end
p(["e"].map { it("f") })

# `lambda` is a method rather than syntax, so a program may name a local
# after it.
lambda = ->(first, second) { [first, second] }
p(lambda.call(1, 2))
p(lambda.parameters)
```

Output:

```
"a"
"b"
["c", "d"]
[[:opt]]
[[:req]]
1
nil
["F"]
[1, 2]
[[:req, :first], [:req, :second]]
```
