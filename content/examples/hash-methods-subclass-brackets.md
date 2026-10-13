---
title: "hash_methods/subclass_brackets.rb"
slug: hash-methods-subclass-brackets
description: "The metorex example program hash_methods/subclass_brackets.rb and its output."
---

`tests/_examples/hash_methods/subclass_brackets.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/subclass_brackets.rb){target=_blank rel=noopener}.

```metorex
class StringKeyHash < Hash
  def [](key)
    super(key.to_s)
  end

  def []=(key, value)
    super(key.to_s, value)
  end
end

observers = StringKeyHash.new
observers[:rates] = [:reload]
observers[:tariffs] ||= []
observers[:tariffs] << :refresh
observers[:rates] += [:audit]
p(observers)
p(observers[:tariffs])
```

Output:

```
{"rates" => [:reload, :audit], "tariffs" => [:refresh]}
[:refresh]
```
