---
title: "backtraces/private_call_frame/library.rb"
slug: backtraces-private-call-frame-library
description: "The metorex example program backtraces/private_call_frame/library.rb and its output."
---

`tests/_examples/backtraces/private_call_frame/library.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/private_call_frame/library.rb).

```metorex
class Registry
  class << self
    private

    def hidden(name)
      name
    end
  end
end

class Settings
  def alias_name(name)
    Registry.hidden(name)
  end

  def missing_name
    Registry.not_defined
  end
end
```
