---
title: "oop/alias_method_strings.rb"
slug: oop-alias-method-strings
description: "The metorex example program oop/alias_method_strings.rb and its output."
---

`tests/_examples/oop/alias_method_strings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/alias_method_strings.rb).

```metorex
class Foo
  def original
    "original"
  end

  alias_method "aliased", "original"
  alias_method :sym_alias, :original
end

f = Foo.new
puts f.aliased
puts f.sym_alias
```

Output:

```
original
original
```
