---
title: "builtins/process_hash_seed.rb"
slug: builtins-process-hash-seed
description: "The metorex example program builtins/process_hash_seed.rb and its output."
---

`tests/_examples/builtins/process_hash_seed.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/process_hash_seed.rb){target=_blank rel=noopener}.

```metorex
# A value's hash is the same every time this process asks, and a different
# number in another process, so a table cannot be filled with values chosen
# to collide.
require "rbconfig"

values = ["14", "10**30", "3.14", "Rational(1, 2)", "Complex(1, 2)", "'abc'", ":a", "[1, 2]", "{a: 1}"]
values.each do |written|
  here = eval(written).hash
  again = eval(written).hash
  there = IO.popen([RbConfig.ruby, "-e", "print((#{written}).hash)"], &:read)
  p([written, here.class, here == again, here.to_s != there])
end
```

Output:

```
["14", Integer, true, true]
["10**30", Integer, true, true]
["3.14", Integer, true, true]
["Rational(1, 2)", Integer, true, true]
["Complex(1, 2)", Integer, true, true]
["'abc'", Integer, true, true]
[":a", Integer, true, true]
["[1, 2]", Integer, true, true]
["{a: 1}", Integer, true, true]
```
