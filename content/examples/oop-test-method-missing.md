---
title: "oop/test/method_missing.rb"
slug: oop-test-method-missing
description: "The metorex example program oop/test/method_missing.rb and its output."
---

`tests/_examples/oop/test/method_missing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/method_missing.rb){target=_blank rel=noopener}.

```metorex
class DynamicProxy
  def initialize
    @data = {foo: "bar", count: 42, items: [1, 2, 3]}
  end

  def method_missing(name)
    @data[name]
  end
end

proxy = DynamicProxy.new
puts proxy.foo
puts proxy.count

items = proxy.items
items.each do |item|
  puts item
end
```

Output:

```
bar
42
1
2
3
```
