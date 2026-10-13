---
title: "oop/module/reopen.rb"
slug: oop-module-reopen
description: "The metorex example program oop/module/reopen.rb and its output."
---

`tests/_examples/oop/module/reopen.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module/reopen.rb){target=_blank rel=noopener}.

```metorex
module M
  def self.a
    "a"
  end
end

module M
  def self.b
    "b"
  end
end

puts M.a
puts M.b
```

Output:

```
a
b
```
