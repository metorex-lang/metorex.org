---
title: "oop/scope_resolution/scope_resolution_parens.rb"
slug: oop-scope-resolution-scope-resolution-parens
description: "The metorex example program oop/scope_resolution/scope_resolution_parens.rb and its output."
---

`tests/_examples/oop/scope_resolution/scope_resolution_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/scope_resolution/scope_resolution_parens.rb).

```metorex
# Scope resolution with :: (with parentheses)
class Config
  VERSION = 1
  MAX_SIZE = 100
end

puts(Config::VERSION)
puts(Config::MAX_SIZE)
```

Output:

```
1
100
```
