---
title: "oop/prepend_private_visibility.rb"
slug: oop-prepend-private-visibility
description: "The metorex example program oop/prepend_private_visibility.rb and its output."
---

`tests/_examples/oop/prepend_private_visibility.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/prepend_private_visibility.rb).

```metorex
module Wrapper
  def wrapped
    super + 1
  end
end

class Counter
  prepend Wrapper

  def wrapped
    1
  end
  private :wrapped
end

counter = Counter.new
puts counter.wrapped

module QuietWrapper
  def hidden
    :wrapped
  end
  private :hidden
end

class Vault
  prepend QuietWrapper

  def hidden
    :own
  end
end

begin
  Vault.new.hidden
rescue NoMethodError => error
  puts error.message
end
```

Output:

```
2
private method 'hidden' called for an instance of Vault
```
