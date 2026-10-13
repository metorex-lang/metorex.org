---
title: "oop/scope_resolution/scope_resolution.rb"
slug: oop-scope-resolution-scope-resolution
description: "The metorex example program oop/scope_resolution/scope_resolution.rb and its output."
---

`tests/_examples/oop/scope_resolution/scope_resolution.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/scope_resolution/scope_resolution.rb){target=_blank rel=noopener}.

```metorex
# Scope resolution with ::
class Config
  VERSION = 1
  MAX_SIZE = 100
end

puts Config::VERSION
puts Config::MAX_SIZE
```

Output:

```
1
100
```
