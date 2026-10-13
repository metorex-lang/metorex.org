---
title: "constants/when_constant_in_called_method.rb"
slug: constants-when-constant-in-called-method
description: "The metorex example program constants/when_constant_in_called_method.rb and its output."
---

`tests/_examples/constants/when_constant_in_called_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/constants/when_constant_in_called_method.rb){target=_blank rel=noopener}.

```metorex
module Kinds
  class << self
    def of(value)
      case value
      when Array then :array
      else :other
      end
    end
  end
end

class Host
  Array = :shadow
end

Host.class_exec do
  p Kinds.of([1])
end
```

Output:

```
:array
```
